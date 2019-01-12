module JekyllPatternbot
  module PatternHelper

    def self.slug_to_words(slug)
      slug.gsub(/[\-_]/, ' ').gsub(/\s+/, ' ')
    end

    def self.title(pattern, subpattern, data, subdata)
      group_title = self.slug_to_words(pattern).unicode_titlecase
      pattern_title = self.slug_to_words(subpattern).unicode_titlecase
      group_title = data['title'] if data.is_a?(Hash) and data.key?('title')
      pattern_title = subdata['title'] if subdata.is_a?(Hash) and subdata.key?('title')
      "#{pattern_title} · #{group_title}"
    end

  end
end
