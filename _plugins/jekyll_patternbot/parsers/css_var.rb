module JekyllPatternbot
  class CSSVarParser

    def self.parse(filepath)
      return false unless File.file? filepath
      vars = []
      comment_match = false
      File.open(filepath).each do |line|
        unless comment_match
          comment_match = line.strip.match Regexp.new "\\/\\*\s*#{Config['patternbot']['css']['var_tag'].strip}\s+(?<description>[^\\*]*)\s*\\*\\/"
        end
        if comment_match
          var_match = line.strip.match /(?<var>\-\-[^\:]+)\:(?<val>[^\;]+)\;/
          if var_match
            vars.push({
              :name => var_match[:var].strip,
              :value => var_match[:val].strip,
              :description => comment_match[:description].strip,
            })
            comment_match = false
          end
        end
      end
      vars
    end

  end
end
