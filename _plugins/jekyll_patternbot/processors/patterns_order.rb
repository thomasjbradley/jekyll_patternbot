module JekyllPatternbot
  class PatternsOrderProcessor

    def process
      pattern_names = PatternbotData[:patterns][:user].keys
      pattern_names.sort_by!{ |p| p.downcase }
    end

  end
end
