module JekyllPatternbot
  class PatternsFinder

    def initialize
      @internal_source = File.expand_path '../../../../_patterns', __dir__
      @internal_patterns = FileHelpers.list_dirs @internal_source
      @user_source = File.expand_path Config['patternbot']['source']
      @user_patterns = FileHelpers.list_dirs @user_source
    end

    def pattern_config(patternpath)
      config_path = File.expand_path 'config.yml', patternpath
      return false unless File.file?(config_path)
      PatternHelper.config_valid? YAML.load_file(config_path)
    end

    def patterns_info(source, patterns_names)
      patterns = {}
      for pattern in patterns_names
        dir = File.expand_path pattern, source
        patterns[pattern] = {
          :name => pattern,
          :source => dir,
          :config => pattern_config(dir),
        }
      end
      patterns
    end

    def internal_patterns_info
      patterns_info @internal_source, @internal_patterns
    end

    def user_patterns_info
      patterns_info @user_source, @user_patterns
    end

  end
end
