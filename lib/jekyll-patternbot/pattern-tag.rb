module JekyllPatternbot
  class PatternTag < Jekyll::Tags::IncludeTag

    def tag_includes_dirs(context)
      [File.join(context.registers[:site].config['source'], '_patterns')].freeze
    end

  end
end
