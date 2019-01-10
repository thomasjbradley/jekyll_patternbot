module JekyllPatternbot

  class PatternLib < Jekyll::Generator
    priority :normal

    def initialize(site)
      @site = site
    end

    def generate(site)
      @site = site
    end

  end

end
