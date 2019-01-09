module JekyllPatternbot
  class IconsFinder < Finder

    def base
      {
        :filename => false,
        :icons => [],
      }
    end

    def info
      icons = []
      for file in files
        icon_file = base.clone
        icon_file[:filename] = file
        icons.push(icon_file)
      end
      icons
    end

  end
end
