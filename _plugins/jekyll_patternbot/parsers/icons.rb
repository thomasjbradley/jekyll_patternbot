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

    def info
      for file in @icon_files
        data = File.read filepath file[:filename]
        file[:icons] = symbols data
      end
      @icon_files
    end

  end
end
