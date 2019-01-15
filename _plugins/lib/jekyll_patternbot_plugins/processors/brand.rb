module JekyllPatternbot
  class BrandProcessor

    def remove_colors
      unless PatternbotData[:css].key? :theme and PatternbotData[:css][:theme].key? :colors
        PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'colors'
      end
    end

    def remove_typefaces
      unless PatternbotData[:css].key? :theme and PatternbotData[:css][:theme].key? :fonts
        PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'typefaces'
      end
    end

    def process()
      remove_colors
      remove_typefaces
    end

  end
end
