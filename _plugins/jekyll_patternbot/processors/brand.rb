module JekyllPatternbot
  class BrandProcessor

    def remove_colors
      unless PatternbotData[:css].key? :theme and PatternbotData[:css][:theme].key? :colors and PatternbotData[:css][:theme][:colors] and PatternbotData[:css][:theme][:colors].key? :primary and PatternbotData[:css][:theme][:colors][:primary].length > 0
        PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'colors'
      end
    end

    def remove_typefaces
      unless PatternbotData[:css].key? :theme and PatternbotData[:css][:theme].key? :fonts and PatternbotData[:css][:theme][:fonts].key? :primary
        PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'typefaces'
      end
    end

    def process()
      remove_colors
      remove_typefaces
    end

  end
end
