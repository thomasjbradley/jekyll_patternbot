module JekyllPatternbot
  class CSSUtilityParser < CSSCommentTagParser

    def self.parse(filepath)
      return false unless File.file? filepath
      utilities = {}
      comment_match = false
      File.open(filepath).each do |line|
        unless comment_match
          comment_match = line.strip.match Regexp.new "\\/\\*\s*#{Config['patternbot']['css']['utility_tag'].strip}\s+(?<description>[^\\*]*)\s*\\*\\/"
        end
        if comment_match
          category = 'uncategorized'
          category_match = comment_match.string.match Regexp.new "\\#{Config['patternbot']['css']['category_tag'].strip}(?<category>[^\s]+)"

          if category_match
            category = category_match[:category]
          end

          unless utilities.key? category
            utilities[category] = []
          end

          class_match = line.strip.match /\.[\w\d\-\_]+/

          if class_match
            utilities[category].push({
              :class => class_match[0].strip,
              :description => self.clean_desc(comment_match[:description], category),
            })
            comment_match = false
          end
        end
      end
      utilities.sort_by { |key| key }.to_h
    end

  end
end
