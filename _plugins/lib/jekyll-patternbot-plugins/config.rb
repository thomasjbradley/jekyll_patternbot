module JekyllPatternbot
  Config = YAML.load_file(File.expand_path('../../../_config.yml', __dir__))
end
