module JekyllPatternbot
  module TextFilters

    def as_title(s)
      PatternHelper.slug_to_words(s).unicode_titlecase
    end

    def has_pattern_rationale(id, *namespaces)
      namespaces.push(id)
      Config['patternbot']['rationales'].key? namespaces.join('.')
    end

    def get_pattern_rationale(id, *namespaces)
      namespaces.push(id)
      Config['patternbot']['rationales'][namespaces.join('.')]
    end

  end
end

Liquid::Template.register_filter(JekyllPatternbot::TextFilters)
