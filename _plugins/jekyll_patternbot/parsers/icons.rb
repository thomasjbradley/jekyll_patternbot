module JekyllPatternbot
  class IconsParser

    def initialize(config, icon_files)
      @config = config
      @icon_files = icon_files
    end

    def filepath(filename)
      File.expand_path filename, @config['source']
    end

    def symbols(data)
      matches = data.scan /<symbol[^>]*id\s*=\s*"([^"]+)"/
      matches.flatten
    end

    def classes
      internal_source = File.expand_path "../../../_patterns/icons/icon-classes.yml", __dir__
      return [] unless File.file? internal_source
      icon_classes = YAML.load_file internal_source
      icon_classes
    end

    def info
      for file in @icon_files
        data = File.read filepath file[:filename]
        file[:icons] = symbols data
      end
      @icon_files
    end

  end
end
