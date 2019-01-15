module JekyllPatternbot

  module PatternCSS

    def self.css_files
      FileHelper.list_files_with_ext Config['patternbot']['source'], 'css'
    end

    def self.css
      css = {}
      css_files.each do |file|
        css[FileHelper.strip file] = File.read(file)
      end
      css
    end

  end

  class PatternCSSTag < Liquid::Tag
    def render(context)
      PatternCSS.css.map { |k, v| v } .join("\n")
    end
  end

end

Liquid::Template.register_tag('pattern_css', JekyllPatternbot::PatternCSSTag)
