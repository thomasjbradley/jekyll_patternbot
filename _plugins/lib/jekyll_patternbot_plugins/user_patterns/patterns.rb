module JekyllPatternbot
  module UserPatterns

    def self.patterns
      FileHelpers.list_dirs Config['patternbot']['settings']['source']
    end

  end
end
