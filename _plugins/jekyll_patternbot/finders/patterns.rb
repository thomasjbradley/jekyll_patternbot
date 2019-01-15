module JekyllPatternbot
  class PatternsFinder

    def initialize
      @internal_source = File.expand_path '../../../_patterns', __dir__
      @internal_patterns = FileHelper.list_dirs @internal_source
      @user_source = File.expand_path Config['patternbot']['source']
      @user_patterns = FileHelper.list_dirs @user_source if File.directory? @user_source
    end

    def user_config(patternpath)
      config_path = File.expand_path Config['patternbot']['config'], patternpath
      return {} unless File.file? config_path
      begin
        config_data = YAML.load_file config_path
      rescue
        return {}
      end
      if config_data.nil? or config_data == false
        return {}
      else
        return config_data
      end
    end

    def html_files(patternpath)
      files = {}
      all_files = FileHelper.list_files_with_ext patternpath, 'html'
      return files unless all_files
      for file in all_files
        files[File.basename(file, '.*')] = nil
      end
      files
    end

    def pattern_config(patternpath)
      config_data = user_config(patternpath)
      files_config = {
        'patterns' => html_files(patternpath)
      }
      config_data.deep_merge! files_config
      config_data
    end

    def patterns_info(source, patterns_names)
      patterns = {}
      if patterns_names
        for pattern in patterns_names
          dir = File.expand_path pattern, source
          patterns[pattern] = {
            :name => pattern,
            :source => dir,
            :config => pattern_config(dir),
          }
        end
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
