module JekyllPatternbot
  class ThemeParser

    def initialize(filename)
      @filename = filename
      @filepath = File.expand_path filename, Config['patternbot']['settings']['css']['source']
    end

    def exists?
      File.file? @filepath
    end

    def data
      @data = File.read(@filepath) if @data.nil?
      @data
    end

    def info
      {
        :filename => @filename,
        :filepath => @filepath,
        :colors => CSSVariableParser.parse(data),
        :fonts => CSSFontParser.parse(Config['patternbot']['font_url'], data),
      }
    end

  end
end
