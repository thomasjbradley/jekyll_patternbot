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
      if data[:config].key? 'patterns' and not data[:config]['patterns'].nil?
        data[:config]['patterns'].each do |subpattern, subdata|
          pages.push to_page pattern, data, subpattern, subdata
        end
      end
      pages
    end

    def to_page(pattern, data, subpattern, subdata)
      source_dir = File.expand_path File.expand_path pattern, Config['patternbot']['source']
      dir = Config['patternbot']['destination'] + '/patterns/' + pattern
      html = Jekyll::PageWithoutAFile.new(@site, @site.source, dir, "#{subpattern}.html")
      html.data['layout'] = 'patternbot_pattern_user'
      html.data['title'] = PatternHelper.title pattern, subpattern, data, subdata
      html.data['_PatternbotConfig'] = Config.with_indifferent_access
      html.data['_PatternbotLocale'] = PatternbotLocale.with_indifferent_access
      html.data['_PatternbotData'] = PatternbotData.with_indifferent_access
      html.data['_pattern'] = pattern
      html.data['_pattern_data'] = data.is_a?(Hash) ? data.with_indifferent_access : {}
      html.data['_subpattern'] = subpattern
      html.data['_subpattern_data'] = subdata.is_a?(Hash) ? subdata.with_indifferent_access : {}

      unless File.file? File.expand_path "#{subpattern}.html", source_dir
        PatternbotLogger.fatal "Patternbot cannot find the associated HTML file for the “#{subpattern}” pattern listed inside the “#{pattern}” config.yml file."
      end

      html.content = JekyllHelper.pattern_tag_with_data(pattern, subpattern, subdata.is_a?(Hash) ? subdata['fields'] : nil)
      html
    end

  end

end
