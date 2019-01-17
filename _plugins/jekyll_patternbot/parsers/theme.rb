module JekyllPatternbot
  class ThemeParser

    def initialize(filename)
      @filename = filename
      @filepath = File.expand_path filename, Config['patternbot']['css']['source']
    end

    def exists?
      File.file? @filepath
    end

    def data
      if @data.nil?
        raw_data = File.read(@filepath)
        parser = CssParser::Parser.new
        parser.load_string!(raw_data)
        css = parser.to_h

        if css.key?('all') and css['all'].key?(':root')
          @data = css['all'][':root']
        end
      end

      @data
    end

    def info
      {
        :filename => @filename,
        :filepath => @filepath,
        :colors => data ? CSSColorParser.parse(data) : {},
        :fonts => data ? CSSFontParser.parse(Config['patternbot']['font_url'], data) : {},
        :utilities => CSSUtilityParser.parse(@filepath),
        :vars => CSSVarParser.parse(@filepath),
      }
    end

  end
end
