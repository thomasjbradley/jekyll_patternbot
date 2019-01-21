module JekyllPatternbot
  class TypografierParser < WebDevToolParser

    def settings
      type_settings = []
      url_info = extract_url_info

      return nil unless url_info

      url_info.split(/\;/).each do |mq_string|
        mq = {}
        mq[:mq], mq[:font_size], mq[:line_height], mq[:scale] = mq_string.split(/\,/)
        mq = Hash[mq.map {|k, v| [k, v.to_f] }]
        type_settings.push(mq)
      end

      type_settings
    end

    def utility_classes
      WebDevToolParser.utility_classes_for_tool('typography')
    end

  end
end
