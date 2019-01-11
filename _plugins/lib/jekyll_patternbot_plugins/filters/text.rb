module JekyllPatternbot
  module TextFilters

    def as_title(s)
      PatternHelper.slug_to_words(s).unicode_titlecase
    end

    def has_pattern_rationale(id, *namespaces)
      namespaces.push(id)
      Config['patternbot']['rationales'].key? namespaces.join('.')
    end

    def get_pattern_rationale(id, *namespaces)
      namespaces.push(id)
      Config['patternbot']['rationales'][namespaces.join('.')]
    end

    def sub_web_dev_tool_urls(text)
      text.gsub!(/\+\+modulifier\-settings\-url\+\+/, PatternbotData[:css][:modulifier][:url]) if PatternbotData[:css][:modulifier]
      text.gsub!(/\+\+gridifier\-settings\-url\+\+/, PatternbotData[:css][:gridifier][:url]) if PatternbotData[:css][:gridifier]
      text.gsub!(/\+\+typografier\-settings\-url\+\+/, PatternbotData[:css][:typografier][:url]) if PatternbotData[:css][:typografier]
      text
    end

  end
end

Liquid::Template.register_filter(JekyllPatternbot::TextFilters)
