module JekyllPatternbot
  PatternbotLogger = Logger.new STDERR
  PatternbotCache = {}
  PatternbotData = {
    :css => {},
    :logos => false,
    :icons => false,
    :patterns => {},
    :pages => [],
  }

  Jekyll::Hooks.register :site, :post_read do |site|
    PatternbotLogger.formatter = proc do |severity, datetime, progname, msg|
      "ERROR: #{datetime}: #{msg}\n"
    end

    # File.open('/Users/thomasjbradley/Desktop/patternbot-config.json', 'w') do |f|
    #   f.write(JSON.pretty_generate(Config))
    # end

    modulifier = ModulifierParser.new(Config['patternbot']['css']['modulifier'])
    PatternbotData[:css][:modulifier] = modulifier.exists? ? modulifier.info : nil

    gridifier = GridifierParser.new(Config['patternbot']['css']['gridifier'])
    PatternbotData[:css][:gridifier] = gridifier.exists? ? gridifier.info : nil

    typografier = TypografierParser.new(Config['patternbot']['css']['typografier'])
    PatternbotData[:css][:typografier] = typografier.exists? ? typografier.info : nil

    theme = ThemeParser.new(Config['patternbot']['css']['theme'])
    PatternbotData[:css][:theme] = theme.exists? ? theme.info : nil

    logos = LogosFinder.new(Config['patternbot']['logos'])
    PatternbotData[:logos] = logos.exists? ? logos.info : nil

    icon_files = IconsFinder.new(Config['patternbot']['icons'])
    if icon_files.exists?
      icons = IconsParser.new(Config['patternbot']['icons'], icon_files.info)
      PatternbotData[:icons] = icons.info
    else
      PatternbotData[:icons] = nil
    end

    pattern_files = PatternsFinder.new
    PatternbotData[:patterns] = {
      :internal => pattern_files.internal_patterns_info,
      :user => pattern_files.user_patterns_info,
    }

    pages = SamplePagesFinder.new
    PatternbotData[:pages] = pages.info

    brand_processor = BrandProcessor.new.process
    modules_processor = ModulesProcessor.new.process

    # File.open('/Users/thomasjbradley/Desktop/patternbot.json', 'w') do |f|
    #   f.write(JSON.pretty_generate(PatternbotData))
    # end
  end

end
