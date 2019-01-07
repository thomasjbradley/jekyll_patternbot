module JekyllPatternbot

  Jekyll::Hooks.register :site, :post_read do |site|
    PatternbotCache = {}
    PatternbotData = {
      :css => {}
    }

    modulifier = ModulifierParser.new(Config['patternbot']['settings']['css']['modulifier'])
    PatternbotData[:css][:modulifier] = modulifier.info if modulifier.exists?

    gridifier = GridifierParser.new(Config['patternbot']['settings']['css']['gridifier'])
    PatternbotData[:css][:gridifier] = gridifier.info if gridifier.exists?

    typografier = TypografierParser.new(Config['patternbot']['settings']['css']['typografier'])
    PatternbotData[:css][:typografier] = typografier.info if typografier.exists?

    theme = ThemeParser.new(Config['patternbot']['settings']['css']['theme'])
    PatternbotData[:css][:theme] = theme.info if theme.exists?

    # Find logos

    # Parse brand pattern
    # Parse typography pattern
    # Parse grid pattern
    # Parse modules pattern
    # Parse icons pattern

    # Parse all user patterns (Handled by user pattern generator)
    puts PatternbotData.inspect
  end

end
