module JekyllPatternbot
  class LayoutsFinder

    def base
      {
        :name => false,
        :description => false,
      }
    end

    def info
      layouts_dir = File.expand_path Config['layouts_dir']
      layouts = []
      return layouts unless File.directory? layouts_dir
      layout_files = FileHelper.list_files_with_ext layouts_dir, '*'
      for layout in layout_files
        layout_data = base.clone
        layout_data[:name] = File.basename layout, '.*'
        unless Config['patternbot']['layouts'].nil?
          Config['patternbot']['layouts'].each do |key, desc|
            if key == layout_data[:name]
              layout_data[:description] = desc.strip if desc
            end
          end
        end
        layouts.push layout_data
      end
      layouts
    end

  end
end
