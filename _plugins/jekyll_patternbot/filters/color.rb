module JekyllPatternbot
  module ColorFilters

    def get_interface_color(color)
      fg = ColorContrastCalc.color_from('black')
      bg = ColorHelper.color color
      if fg.contrast_ratio_against(bg) < 4.5
        fg = ColorContrastCalc.color_from('white')
      end
      fg.hex.downcase
    end

    def get_interface_color_opposite(color)
      fg = get_interface_color(color)
      if fg == '#ffffff'
        return '#000000'
      end
      '#ffffff'
    end

    def as_hex(color)
      ColorHelper.color(color).hex.downcase
    end

    def as_rgba(color, opacity=1)
      "rgba(#{ColorHelper.color(color).rgb.join(',')},#{opacity})"
    end

    def as_rgb_digit(color)
      ColorHelper.color(color).rgb[0]
    end

    def has_pattern_background_color(id, *namespaces)
      namespaces.push(id)
      unless Config['patternbot']['colors']['patterns'].nil?
        return (Config['patternbot']['colors']['patterns'].is_a?(Hash) and Config['patternbot']['colors']['patterns'].key?(namespaces.join('.')))
      end
      return false
    end

    def get_pattern_background_color(id, *namespaces)
      bg = ''
      namespaces.push(id)
      key = namespaces.join('.')
      unless Config['patternbot']['colors']['patterns'].nil?
        if Config['patternbot']['colors']['patterns'].is_a?(Hash) and Config['patternbot']['colors']['patterns'].key? key
          bg = Config['patternbot']['colors']['patterns'][key]
        end
      end
      ColorHelper.color(bg).hex.downcase
    end

    def get_pattern_interface_color(id, *namespaces)
      get_interface_color get_pattern_background_color id, *namespaces
    end

    def get_pattern_interface_color_opposite(id, *namespaces)
      get_interface_color_opposite get_pattern_background_color id, *namespaces
    end

    def get_var_colors(id, *namespaces)
      var_colors = []
      namespaces.push(id)
      key_name = namespaces.join('.')
      unless Config['patternbot']['colors']['patterns'].nil?
        if Config['patternbot']['colors']['patterns'].is_a?(Hash)
          Config['patternbot']['colors']['patterns'].each do |key, val|
            if key.start_with?(key_name + '.')
              var_colors.push({
                'key' => key.sub(key_name + '.', ''),
                'val' => val,
              })
            end
          end
        end
      end
      if var_colors.length > 0
        return var_colors
      else
        return false
      end
    end

  end
end

Liquid::Template.register_filter(JekyllPatternbot::ColorFilters)
