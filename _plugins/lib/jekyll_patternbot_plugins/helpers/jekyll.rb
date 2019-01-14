module JekyllPatternbot
  module JekyllHelper

    def self._pattern_data_source_var_name(field)
      "patternbot_temp_var_#{field['name']}"
    end

    def self._pattern_assign_tags(fields)
      assign_tags = []
      for field in fields
        unless field['required'] == false
          if field.key? 'data'
            assign_tags.push "{% assign #{self._pattern_data_source_var_name(field)}=#{field['data']['source']} %}"
          end
        end
      end
      assign_tags
    end

    def self._pattern_include_fields(fields, datasource=false)
      liquid_fields = []
      for field in fields
        unless field['required'] == false
          if field.key? 'data'
            if datasource
              liquid_fields.push "#{field['name']}=#{self._pattern_data_source_var_name(field)}"
            else
              liquid_fields.push "#{field['name']}=#{field['data']['type']}"
            end
          end
          if field.key? 'example'
            liquid_fields.push "#{field['name']}=\"#{field['example']}\""
          end
        end
      end
      liquid_fields
    end

    def self._pattern_include(pattern, subpattern, fields)
      extra_space = ' ' if fields.length > 0
      "{% pattern #{pattern}/#{subpattern}#{extra_space}#{fields.join(' ')} %}"
    end

    def self.pattern_tag(pattern, subpattern, fields)
      liquid_fields = []
      liquid_fields = self._pattern_include_fields fields if fields
      self._pattern_include pattern, subpattern, liquid_fields
    end

    def self.pattern_tag_with_data(pattern, subpattern, fields)
      liquid_fields = []
      liquid_fields = self._pattern_include_fields fields, true if fields
      assign_tags = []
      assign_tags = self._pattern_assign_tags fields if fields
      assign_tags.concat [self._pattern_include(pattern, subpattern, liquid_fields)]
      assign_tags.join
    end

  end
end
