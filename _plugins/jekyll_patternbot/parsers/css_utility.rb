module JekyllPatternbot
  class CSSUtilityParser

    def self.parse(filepath)
      return false unless File.file? filepath
      utilities = []
      comment_match = false
      File.open(filepath).each do |line|
        unless comment_match
          comment_match = line.strip.match Regexp.new "\\/\\*\s*#{Config['patternbot']['css']['utility_tag'].strip}\s+(?<description>[^\\*]*)\s*\\*\\/"
        end
        if comment_match
          class_match = line.strip.match /\.[\w\d\-\_]+/
          if class_match
            utilities.push({
              :class => class_match[0].strip,
              :description => comment_match[:description].strip,
            })
            comment_match = false
          end
        end
      end
      utilities
    end

  end
end
