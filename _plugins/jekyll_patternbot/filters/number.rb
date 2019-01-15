module JekyllPatternbot
  module NumberFilters

    def strip_trailing_zero(n)
      n.to_s.sub(/\.?0+$/, '')
    end

  end
end

Liquid::Template.register_filter(JekyllPatternbot::NumberFilters)
