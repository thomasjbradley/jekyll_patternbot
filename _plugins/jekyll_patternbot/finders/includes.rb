module JekyllPatternbot
  class IncludesFinder

    def base
      {
        :name => false,
        :description => false,
      }
    end

    def info
      includes_dir = File.expand_path Config['includes_dir']
      includes = []
      return includes unless File.directory? includes_dir
      include_files = FileHelper.list_files_with_ext includes_dir, '*'
      for include in include_files
        include_data = base.clone
        include_data[:name] = File.basename include, '.*'
        unless Config['patternbot']['includes'].nil?
          Config['patternbot']['includes'].each do |key, desc|
            if key == include_data[:name]
              include_data[:description] = desc.strip if desc
            end
          end
        end
        includes.push include_data
      end
      includes
    end

  end
end
