module JekyllPatternbot
  class ConfigChangeParser

    def parse(site)
      begin
        new_config = YAML.load_file File.expand_path(site.source + '/_config.yml')
      rescue Exception => err
        PatternbotLogger.fatal(err.message)
      else
        if new_config.key? 'patternbot'
          config_base = YAML.load_file File.expand_path('../../../_config.yml', __dir__)
          Config['patternbot'] = config_base['patternbot']
          Config['patternbot'][:version] = JekyllPatternbot::VERSION
          Config['patternbot'].deep_merge! new_config['patternbot']
        end
      end
    end

  end
end
