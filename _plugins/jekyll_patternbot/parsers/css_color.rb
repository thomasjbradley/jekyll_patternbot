module JekyllPatternbot
  class CSSColorParser

    def self.base
      {
        :primary => [],
        :secondary => [],
        :tertiary => [],
        :quaternary => [],
        :neutral => [],
        :accent => [],
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

    def self.parse_color(dec, val)
      parsed_color = ColorHelper::color val
      color = self.color.clone
      color[:name] = dec
      color[:name_pretty] = PatternHelper.slug_to_words(dec.sub(/\-\-color\-/, '')).capitalize
      color[:raw] = val
      color[:hex] = parsed_color.hex.downcase
      color[:rgba] = "rgba(#{parsed_color.rgb.join(', ')}, 1)"
      color
    end

    def self.parse(data)
      colors = self.base.clone
      data.each do |dec, val|
        if self.is_color? dec
          colors[:primary].push(self.parse_color(dec, val)) if dec.match(/\-\-color\-primary/)
          colors[:secondary].push(self.parse_color(dec, val)) if dec.match(/\-\-color\-secondary/)
          colors[:tertiary].push(self.parse_color(dec, val)) if dec.match(/\-\-color\-tertiary/)
          colors[:quaternary].push(self.parse_color(dec, val)) if dec.match(/\-\-color\-quaternary/)
          colors[:neutral].push(self.parse_color(dec, val)) if dec.match(/\-\-color\-neutral/)
          colors[:accent].push(self.parse_color(dec, val)) unless dec.match(/\-\-color\-(primary|secondary|tertiary|quaternary|neutral)/)
          colors[:raw][dec] = val
        end
      end
      colors
    end

  end
end
