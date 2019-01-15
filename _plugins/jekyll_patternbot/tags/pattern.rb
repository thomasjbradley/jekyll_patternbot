module JekyllPatternbot
  class PatternTag < Jekyll::Tags::IncludeTag

    def tag_includes_dirs(context)
      [File.join(context.registers[:site].config['source'], Config['patternbot']['source'])].freeze
    end

    def locate_include_file(context, file, safe)
      if file.end_with? '.html'
        super context, file, safe
      else
        super context, "#{file}.html", safe
      end
    end

  end
end

Liquid::Template.register_tag('pattern', JekyllPatternbot::PatternTag)
