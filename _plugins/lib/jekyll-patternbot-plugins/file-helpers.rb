module JekyllPatternbot
  module FileHelpers

    def self.strip(path)
      path.sub "#{Config['patternbot']['settings']['source']}/", ''
    end

    def self.list_dirs(dir)
      Dir.entries(dir).select { |entry| File.directory? File.join(dir, entry) and !(entry =='.' || entry == '..') }
    end

    def self.list_files_with_ext(dir, ext)
      Dir.glob("#{dir}/**/*.#{ext}")
    end

  end
end
