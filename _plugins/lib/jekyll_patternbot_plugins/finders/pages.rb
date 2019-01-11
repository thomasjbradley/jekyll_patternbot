module JekyllPatternbot
  class PagesFinder

    def initialize
      @user_source = File.expand_path Config['patternbot']['pages']['source']
      @user_pages = FileHelpers.list_files_with_ext @user_source, 'html' if File.directory? @user_source
    end

    def info
      @user_pages.map { |page| page.sub(@user_source, '').sub(/\//, '') }
    end

  end
end
