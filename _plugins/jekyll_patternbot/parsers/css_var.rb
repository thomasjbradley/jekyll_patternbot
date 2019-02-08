module JekyllPatternbot
  class CSSVarParser < CSSCommentTagParser

    def self.parse(filepath)
      return false unless File.file? filepath
      vars = {}
      comment_match = false
      File.open(filepath).each do |line|
        unless comment_match
          comment_match = line.strip.match Regexp.new "\\/\\*\s*#{Config['patternbot']['css']['var_tag'].strip}\s+(?<description>[^\\*]*)\s*\\*\\/"
        end
        if comment_match
          category = 'uncategorized'
          category_match = comment_match.string.match Regexp.new "\\#{Config['patternbot']['css']['category_tag'].strip}(?<category>[^\s]+)"

          if category_match
            category = category_match[:category]
          end

          unless vars.key? category
            vars[category] = []
          end

          var_match = line.strip.match /(?<var>\-\-[^\:]+)\:(?<val>[^\;]+)\;/

          if var_match
            vars[category].push({
              :name => var_match[:var].strip,
              :value => var_match[:val].strip,
              :description => self.clean_desc(comment_match[:description], category),
            })
            comment_match = false
          end
        end
      end
      vars.sort_by { |key| key }.to_h
    end

  end
end
