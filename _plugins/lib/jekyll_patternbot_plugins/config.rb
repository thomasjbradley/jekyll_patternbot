module JekyllPatternbot
  Config = YAML.load_file File.expand_path('../../../_config.yml', __dir__)
  CSSColorNames = YAML.load_file File.new File.expand_path('css_color_names.json', __dir__)
  class << self; attr_accessor :PatternbotCache; end
  class << self; attr_accessor :PatternbotData; end

  Jekyll::Hooks.register :site, :after_init do |site|
    Config.deep_merge! site.config
  end
end
