module JekyllPatternbot
  module TextFilters

    def as_title(s)
      PatternHelper.slug_to_words(s).capitalize
    end

    def has_pattern_rationale(id, *namespaces)
      namespaces.push(id)
      unless Config['patternbot']['rationales'].nil?
        return (Config['patternbot']['rationales'].is_a?(Hash) and Config['patternbot']['rationales'].key?(namespaces.join('.')))
      end
    end

    def get_pattern_rationale(id, *namespaces)
      namespaces.push(id)
      unless Config['patternbot']['rationales'].nil?
        return Config['patternbot']['rationales'][namespaces.join('.')]
      end
      ''
    end

    def sub_web_dev_tool_urls(text)
      text.gsub!(/\+\+modulifier\-settings\-url\+\+/, PatternbotData[:css][:modulifier][:url]) if PatternbotData[:css].key? :modulifier and PatternbotData[:css][:modulifier].key? :url
      text.gsub!(/\+\+gridifier\-settings\-url\+\+/, PatternbotData[:css][:gridifier][:url]) if PatternbotData[:css].key? :gridifier and PatternbotData[:css][:gridifier].key? :url
      text.gsub!(/\+\+typografier\-settings\-url\+\+/, PatternbotData[:css][:typografier][:url]) if PatternbotData[:css].key? :typografier and PatternbotData[:css][:typografier].key? :url
      text
    end

  end
end

Liquid::Template.register_filter(JekyllPatternbot::TextFilters)
