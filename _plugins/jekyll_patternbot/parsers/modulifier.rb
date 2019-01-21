module JekyllPatternbot
  class ModulifierParser < WebDevToolParser

    def settings
      url_info = extract_url_info
      url_info.split(/\;/) if url_info
    end

    def utility_classes
      WebDevToolParser.utility_classes_for_tool('modules')
    end

  end
end
