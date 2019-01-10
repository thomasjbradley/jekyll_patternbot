module JekyllPatternbot
  module ColorFilters

    def has_background_color(id, *namespaces)
      namespaces.push(id)
      Config['patternbot']['colors']['patterns'].key? namespaces.join('.')
    end

    def get_background_color(id, *namespaces)
      bg = ''
      namespaces.push(id)
      key = namespaces.join('.')
      if Config['patternbot']['colors']['patterns'].key? key
        bg = Config['patternbot']['colors']['patterns'][key]
      end
      ColorHelper.color(bg).hex
    end

    def get_interface_color(id, *namespaces)
      fg = ColorContrastCalc.color_from('black')
      bg = ColorHelper.color get_background_color(id, *namespaces)
      if fg.contrast_ratio_against(bg) < 4.5
        fg = ColorContrastCalc.color_from('white')
      end
      fg.hex
    end

    def get_interface_color_opposite(id, *namespaces)
      fg = get_interface_color(id, *namespaces)
      if fg == '#ffffff'
        return '#000000'
      end
      '#ffffff'
    end

    def as_hex(color)
      ColorHelper.color(color).hex
    end

    def as_rgba(color, opacity=1)
      "rgba(#{ColorHelper.color(color).rgb.join(',')},#{opacity})"
    end

  end
end

Liquid::Template.register_filter(JekyllPatternbot::ColorFilters)
