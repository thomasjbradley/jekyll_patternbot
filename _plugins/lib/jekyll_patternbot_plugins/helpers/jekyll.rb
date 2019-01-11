module JekyllPatternbot
  module JekyllHelpers

    def self.pattern_tag(pattern, subpattern, fields)
      liquid_fields = []
      extra_space = ''

      if fields
        liquid_fields = fields.map do |field|
          field['example'] ? "#{field['name']}=\"#{field['example']}\"" : ''
        end
      end

      extra_space = ' ' if liquid_fields.length > 0

      "{% pattern #{pattern}/#{subpattern}#{extra_space}#{liquid_fields.join(' ')} %}"
    end

  end
end
