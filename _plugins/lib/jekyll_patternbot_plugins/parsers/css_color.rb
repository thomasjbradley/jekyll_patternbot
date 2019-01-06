module JekyllPatternbot
  class CSSColorParser

    def self.base
      {
        :parsed => {
          :primary => [],
          :secondary => [],
          :neutral => [],
          :accent => [],
        },
        :raw => {},
      }
    end

    def self.color
      {
        :name => nil,
        :name_pretty => nil,
        :raw => nil,
        :hex => nil,
        :rgba => nil,
      }
    end

    def self.is_color?(dec)
      !!dec.match(/\-\-color\-/)
    end

    def self.parse_color_val(val)
      return RGB::Color.from_rgb_hex(val) if val.match /^\#/
      return RGB::Color.from_rgb_hex(CSSColorNames[val]) if CSSColorNames.key? val
      if val.match /^rgb/
        rgb_bits = val.sub(/rgba?\(/, '').sub(/\)/, '').strip.split(/\,/)
        return RGB::Color.from_rgb(rgb_bits[0].to_i, rgb_bits[1].to_i, rgb_bits[2].to_i)
      end
    end

    def self.parse_color(dec, val)
      color = self.color.clone
      color[:name] = dec
      color[:name_pretty] = PatternHelper.slug_to_words(dec.sub(/\-\-color\-/, '')).unicode_titlecase
      color[:raw] = val
      color[:hex] = self.parse_color_val(val).to_rgb_hex.downcase
      color[:rgba] = "rgba(#{self.parse_color_val(val).to_rgb.join(', ')}, 1)"
      color
    end

    def self.parse(data)
      colors = self.base.clone
      data.each do |dec, val|
        if self.is_color? dec
          colors[:raw][dec] = val
          colors[:parsed][:primary].push(self.parse_color(dec, val)) if dec.match(/\-\-color\-primary/)
          colors[:parsed][:secondary].push(self.parse_color(dec, val)) if dec.match(/\-\-color\-secondary/)
          colors[:parsed][:neutral].push(self.parse_color(dec, val)) if dec.match(/\-\-color\-neutral/)
          colors[:parsed][:accent].push(self.parse_color(dec, val)) unless dec.match(/\-\-color\-(primary|secondary|neutral)/)
        end
      end
      colors
    end

  end
end
