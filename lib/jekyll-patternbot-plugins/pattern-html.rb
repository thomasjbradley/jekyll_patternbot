module JekyllPatternbot

  class PatternHTML < Jekyll::Generator
    priority :normal

    def initialize(site)
      @site = site
    end

    def generate(site)
      @site = site
      @site.pages.concat(patterns)
    end

    def patterns
      pats = []
      Patterns.patterns.each do |pattern|
        pats.concat pattern_pages(pattern)
      end
      pats
    end

    def pattern_pages(pattern)
      dir = Config['patternbot']['settings']['source'] + '/' + pattern
      config_path = File.expand_path('config.yml', dir)
      return [] unless File.file?(config_path)
      pattern_config = Patterns.config_valid? YAML.load_file(config_path)
      pattern_config['patterns'].map { |k, data|to_page(pattern, k, pattern_config, data) }
    end

    def to_page(pattern, subpattern, pattern_data, data)
      dir = Config['patternbot']['settings']['destination'] + '/patterns/' + pattern
      html = Jekyll::PageWithoutAFile.new(@site, @site.source, dir, "#{subpattern}.html")
      html.content = JekyllHelpers.pattern_tag(pattern, subpattern, data.is_a?(Hash) ? data['fields'] : nil)
      html.data['layout'] = 'pattern-single'
      html.data['title'] = Patterns.title pattern, subpattern, pattern_data, data
      html
    end

  end

end
