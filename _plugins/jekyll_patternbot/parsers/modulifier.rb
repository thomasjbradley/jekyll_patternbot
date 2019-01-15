module JekyllPatternbot
  class ModulifierParser < WebDevToolParser

    def settings
      url_info = extract_url_info
      url_info.split(/\;/) if url_info
    end

  end
end
