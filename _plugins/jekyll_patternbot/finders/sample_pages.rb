module JekyllPatternbot
  class SamplePagesFinder

    def initialize
      @user_source = File.expand_path Config['patternbot']['sample_pages']['source']
      @user_pages = FileHelper.list_files_with_ext @user_source, 'html' if File.directory? @user_source
    end

    def info
      if @user_pages
        return @user_pages.map { |page| page.sub(@user_source, '').sub(/\//, '') }
      else
        return false
      end
    end

  end
end
