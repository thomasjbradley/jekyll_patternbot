module JekyllPatternbot
  module PatternHelper

    def self.slug_to_words(slug)
      slug.gsub(/[\-_]/, ' ').gsub(/\s+/, ' ')
    end

    def self.config_valid?(config)
      config
    end

    def self.title(pattern, subpattern, pattern_data, data)
      group_title = self.slug_to_words(pattern).unicode_titlecase
      pattern_title = self.slug_to_words(subpattern).unicode_titlecase
      pattern_title = data['title'] if data.is_a?(Hash) and data.key?('title')
      group_title = pattern_data['title'] if pattern_data.is_a?(Hash) and pattern_data.key?('title')
      "#{pattern_title} · #{group_title}"
    end

  end
end
