module JekyllPatternbot
  module PatternFilters

    def pattern_code(subpattern, pattern, subdata)
      JekyllHelpers.pattern_tag(pattern, subpattern, subdata.is_a?(Hash) ? subdata['fields'] : nil)
    end

  end
end

Liquid::Template.register_filter(JekyllPatternbot::PatternFilters)
