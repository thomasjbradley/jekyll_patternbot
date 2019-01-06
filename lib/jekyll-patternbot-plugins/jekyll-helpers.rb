module JekyllPatternbot
  module JekyllHelpers

    def self.pattern_tag(pattern, subpattern, fields)
      liquid_fields = []

      if fields
        liquid_fields = fields.map do |field|
          field['example'] ? "#{field['name']}=\"#{field['example']}\"" : ''
        end
      end

      "{% pattern #{pattern}/#{subpattern} #{liquid_fields.join(' ')} %}"
    end

  end
end
