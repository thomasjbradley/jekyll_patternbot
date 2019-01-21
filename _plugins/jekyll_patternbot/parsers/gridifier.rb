module JekyllPatternbot
  class GridifierParser < WebDevToolParser

    def settings
      grid_settings = []
      url_info = extract_url_info

      return nil unless url_info

      url_info.split(/\;/).each do |mq_string|
        mq = {}
        mq[:prefix], mq[:columns], mq[:mq] = mq_string.split(/\,/)
        mq[:columns] = mq[:columns].to_i
        mq[:mq] = mq[:mq].to_f
        grid_settings.push(mq)
      end

      grid_settings
    end

    def utility_classes
      WebDevToolParser.utility_classes_for_tool('grid')
    end

  end
end
