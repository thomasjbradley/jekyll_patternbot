module JekyllPatternbot

  class UserPatternsGenerator < Jekyll::Generator
    priority :normal

    def initialize(site)
      @site = site
    end

    def generate(site)
      @site = site
      @site.pages.concat patterns
    end

    def patterns
      pats = []
      PatternbotData[:patterns][:user].each do |pattern, data|
        pats.concat pattern_pages(pattern, data)
      end
      pats
    end

    def pattern_pages(pattern, data)
      pages = []
      data[:config]['patterns'].each do |subpattern, subdata|
        pages.push to_page pattern, data, subpattern, subdata
      end
      pages
    end

    def to_page(pattern, data, subpattern, subdata)
      dir = Config['patternbot']['destination'] + '/patterns/' + pattern
      html = Jekyll::PageWithoutAFile.new(@site, @site.source, dir, "#{subpattern}.html")
      html.data['layout'] = 'patternbot_pattern_user'
      html.data['title'] = PatternHelper.title pattern, subpattern, data, subdata
      html.data['_PatternbotConfig'] = Config.with_indifferent_access
      html.data['_PatternbotData'] = PatternbotData.with_indifferent_access
      html.data['_pattern'] = pattern
      html.data['_pattern_data'] = data.with_indifferent_access if data.is_a?(Hash)
      html.data['_subpattern'] = subpattern
      html.data['_subpattern_data'] = subdata.with_indifferent_access if subdata.is_a?(Hash)
      html.content = JekyllHelpers.pattern_tag(pattern, subpattern, subdata.is_a?(Hash) ? subdata['fields'] : nil)
      html
    end

  end

end
