module JekyllPatternbot
  require 'jekyll-patternbot/settings'

  class PatternSingle < Jekyll::Generator
    priority :normal

    def initialize(site)
      @site = site
    end

    def generate(site)
      @site = site
      # site.pages.concat(patterns_to_pages)
    end

    def patterns_to_pages
      html_files.map { |doc| page_from_static_file(doc) }
    end

    def html_files
      @site.documents.each.select { |doc| doc.relative_path.start_with? site.config.patternbot.settings.patterns_folder and doc.extname == '.html' }
    end

    def page_from_static_file(static_file)
      base = static_file.instance_variable_get('@base')
      dir  = static_file.instance_variable_get('@dir')
      name = static_file.instance_variable_get('@name')
      data = static_file.instance_variable_get('@data')
      # data['layout'] = Jekyll::Layout.new()
      Jekyll::Page.new(@site, base, dir, name)#.data = data
    end

  end
end
