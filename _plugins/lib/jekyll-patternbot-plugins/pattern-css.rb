module JekyllPatternbot
  module PatternCSS

    def self.css
      css = {}
      css_files.each do |file|
        css[FileHelpers.strip file] = File.read(file)
      end
      css
    end

    def self.css_files
      FileHelpers.list_files_with_ext Config['patternbot']['settings']['source'], 'css'
    end

  end
end
