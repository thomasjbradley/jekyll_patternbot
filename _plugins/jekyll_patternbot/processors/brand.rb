module JekyllPatternbot
  class BrandProcessor

    def remove_unless_colors
      begin PatternbotData.dig(:css, :theme, :colors, :primary)
        unless PatternbotData[:css][:theme][:colors][:primary].length > 0
          PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'colors'
        end
      rescue
        PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'colors'
      end
    end

    def remove_unless_typefaces
      begin PatternbotData.dig(:css, :theme, :fonts, :primary)
        unless PatternbotData.dig(:css, :theme, :fonts, :primary)
          PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'typefaces'
        end
      rescue
        PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'typefaces'
      end
    end

    def process
      remove_unless_colors
      remove_unless_typefaces
    end

  end
end
