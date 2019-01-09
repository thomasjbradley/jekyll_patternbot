module JekyllPatternbot
  module UserPatterns

    def self.patterns
      FileHelpers.list_dirs Config['patternbot']['source']
    end

  end
end
