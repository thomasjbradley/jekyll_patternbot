module JekyllPatternbot
  class Finder

    def initialize(config)
      @config = config
      @source = config['source']
    end

    def files_list
      files = []
      for ext in @config['extensions']
        for file in @config['filenames']
          files.push("#{file}#{ext}")
        end
      end
      files
    end

    def files
      if @files.nil?
        @files = []
        for file in files_list
          @files.push(file) if File.file? File.expand_path file, @source
        end
      end
      @files
    end

    def exists?
      files.length > 0
    end

  end
end
