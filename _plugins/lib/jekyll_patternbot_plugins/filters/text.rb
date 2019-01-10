module JekyllPatternbot
  module TextFilters

    def as_title(s)
      PatternHelper.slug_to_words(s).unicode_titlecase
    end

  end
end

Liquid::Template.register_filter(JekyllPatternbot::TextFilters)
