module JekyllPatternbot
  class IconsFinder < Finder

    def base
      {
        :name => false,
        :filename => false,
        :icons => [],
      }
    end

    def info
      icons = []
      for file in files
        exts = Regexp.new '(' + Config['patternbot']['icons']['extensions'].join('|') + ')'
        icon_file = base.clone
        icon_file[:name] = file.gsub(exts, '')
        icon_file[:filename] = file
        icons.push(icon_file)
      end
      icons
    end

  end
end
