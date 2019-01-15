module JekyllPatternbot
  class ColorHelper

    def self.color(val)
      the_color = val
      if (val.match(/^\-\-/) and
        PatternbotData.key? :css and
        PatternbotData[:css].key? :theme and
        PatternbotData[:css][:theme].key? :colors and
        PatternbotData[:css][:theme][:colors].key? :raw and
        PatternbotData[:css][:theme][:colors][:raw].key? val)
        the_color = PatternbotData[:css][:theme][:colors][:raw][val]
      end
      if the_color.match? /^rgb/
        rgb_bits = the_color.gsub(/[^\d,]/, '').split(/\,/)
        the_color = [rgb_bits[0].to_i, rgb_bits[1].to_i, rgb_bits[2].to_i]
      end
      begin
        return ColorContrastCalc.color_from the_color
      rescue
        return ColorContrastCalc.color_from 'black'
      end
    end

  end
end
