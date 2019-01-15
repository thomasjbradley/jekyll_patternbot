module JekyllPatternbot

  class InternalPatternsGenerator < Jekyll::Generator
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
      PatternbotData[:patterns][:internal].each do |pattern, data|
        pats.concat pattern_pages(pattern, data)
      end
      pats
    end

    def pattern_pages(pattern, data)
      pages = []
      return pages unless data[:config].key? 'patterns'
      data[:config]['patterns'].each do |subpattern, subdata|
        pages.push to_page pattern, data, subpattern, subdata
      end
      pages
    end

    def to_page(pattern, data, subpattern, subdata)
      dir = Config['patternbot']['destination'] + '/patterns/' + pattern
      html = Jekyll::PageWithoutAFile.new(@site, @site.source, dir, "#{subpattern}.html")
      html.data['title'] = PatternHelper.title pattern, subpattern, data, subdata
      html.data['layout'] = data[:config]['_layout']
      html.data['_PatternbotConfig'] = Config.with_indifferent_access
      html.data['_PatternbotLocale'] = PatternbotLocale.with_indifferent_access
      html.data['_PatternbotData'] = PatternbotData.with_indifferent_access
      html.data['_pattern'] = pattern
      html.data['_pattern_data'] = data.is_a?(Hash) ? data.with_indifferent_access : {}
      html.data['_subpattern'] = subpattern
      html.data['_subpattern_data'] = subdata.is_a?(Hash) ? subdata.with_indifferent_access : {}

      begin
        html.content = File.read File.expand_path "#{subpattern}.html", data[:source]
      rescue
        PatternbotLogger.fatal "Patternbot cannot find the associated HTML file for the “#{subpattern}” pattern listed inside the “#{pattern}” config.yml file."
      end

      html
    end

  end

end
