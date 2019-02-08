module JekyllPatternbot
  class CSSCommentTagParser

      def self.clean_desc(desc, cat)
        cat_regex = Regexp.new "\\#{Config['patternbot']['css']['category_tag'].strip}#{cat}"
        desc = desc.sub(cat_regex, '')
        desc = desc.sub(/\s+/, ' ')
        desc.strip
      end

  end
end
