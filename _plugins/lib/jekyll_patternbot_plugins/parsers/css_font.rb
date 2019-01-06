module JekyllPatternbot
  class CSSFontParser

    def self.default
      {
        :parsed => {
          :primary => {},
          :secondary => {},
          :accent => [],
        },
        :raw => {},
      }
    end

    def self.parse(font_url, data)
      true
    end

  end
end
