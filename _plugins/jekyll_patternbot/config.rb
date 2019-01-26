module JekyllPatternbot
  Config = YAML.load_file File.expand_path('../../_config.yml', __dir__)
  class << self; attr_accessor :PatternbotLogger; end
  class << self; attr_accessor :PatternbotCache; end
  class << self; attr_accessor :PatternbotLocale; end
  class << self; attr_accessor :PatternbotData; end

  Jekyll::Hooks.register :site, :after_init do |site|
    unless site.config.key? 'theme' and site.config['theme'] == 'jekyll_patternbot'
      raise 'Specify “theme: jekyll_patternbot” inside your Jekyll `_config.yml` file.'
    end

    unless site.config.key? 'patternbot' and site.config['patternbot'].is_a?(Hash)
      site.config['patternbot'] = {}
    end

    Config.deep_merge! site.config
    Config['patternbot'][:version] = JekyllPatternbot::VERSION

    locale_path = File.expand_path("../../_data/locales/#{Config['patternbot']['locale']}.yml", __dir__)
    if File.file? locale_path
      PatternbotLocale = YAML.load_file locale_path
    else
      PatternbotLocale = YAML.load_file File.expand_path("../../_data/locales/en-ca.yml", __dir__)
    end
  end
end
