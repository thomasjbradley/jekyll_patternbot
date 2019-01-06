module JekyllPatternbot
  class GridifierParser < WebDevToolParser

    def settings
      grid_settings = []
      url_info = extract_url_info

      return nil if not url_info

      url_info.split(/\;/).each do |mq_string|
        mq = {}
        mq[:prefix], mq[:columns], mq[:mq] = mq_string.split(/\,/)
        mq[:columns] = mq[:columns].to_f
        mq[:mq] = mq[:mq].to_f
        grid_settings.push(mq)
      end

      grid_settings
    end

  end
end
