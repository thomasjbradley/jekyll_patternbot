module JekyllPatternbot
  class BrandProcessor

    def remove_unless_colors
      has_primary_colors = true
      has_accent_colors = true

      begin PatternbotData.dig(:css, :theme, :colors, :primary)
        unless PatternbotData[:css][:theme][:colors][:primary].length > 0
          has_primary_colors = false
        end
      rescue
          has_primary_colors = false
      end

      begin PatternbotData.dig(:css, :theme, :colors, :accent)
        unless PatternbotData[:css][:theme][:colors][:accent].length > 0
          has_accent_colors = false
        end
      rescue
          has_accent_colors = false
      end

      unless has_primary_colors or has_accent_colors
        PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'colors'
      end
    end

    def remove_unless_typefaces
      has_primary_typefaces = true
      has_accent_typefaces = true

      begin PatternbotData.dig(:css, :theme, :fonts, :primary)
        unless PatternbotData.dig(:css, :theme, :fonts, :primary)
          has_primary_typefaces = false
        end
      rescue
        has_primary_typefaces = false
      end

      begin PatternbotData.dig(:css, :theme, :fonts, :accent)
        unless PatternbotData.dig(:css, :theme, :fonts, :accent)
          has_accent_typefaces = false
        end
      rescue
        has_accent_typefaces = false
      end

      unless has_primary_typefaces or has_accent_typefaces
        PatternbotData[:patterns][:internal]['brand'][:config]['patterns'].delete 'typefaces'
      end
    end

    def process
      remove_unless_colors
      remove_unless_typefaces
    end

  end
end
