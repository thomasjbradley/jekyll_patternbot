module JekyllPatternbot

  class PatternLibGenerator < Jekyll::Generator
    priority :normal

    def initialize(site)
      @site = site
    end

    def generate(site)
      @site = site
      @site.pages.concat [pattern_lib_page]
    end

    def pattern_lib_page()
      html = Jekyll::PageWithoutAFile.new(@site, @site.source, Config['patternbot']['destination'], 'index.html')
      html.data['layout'] = 'patternbot_pattern_lib'
      html.data['_PatternbotConfig'] = Config.with_indifferent_access
      html.data['_PatternbotLocale'] = PatternbotLocale.with_indifferent_access
      html.data['_PatternbotData'] = PatternbotData.with_indifferent_access
      html.content = ''
      html
    end

  end

end
