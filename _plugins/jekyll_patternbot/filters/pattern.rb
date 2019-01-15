module JekyllPatternbot
  module PatternFilters

    def pattern_code(subpattern, pattern, subdata)
      JekyllHelper.pattern_tag(pattern, subpattern, subdata.is_a?(Hash) ? subdata['fields'] : nil)
    end

    def normalize_filename(filename)
      PatternHelper.normalize_filename filename
    end

  end
end

Liquid::Template.register_filter(JekyllPatternbot::PatternFilters)
