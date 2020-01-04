module JekyllPatternbot
  PatternbotLogger = PatternbotConsoleLogger.new
  PatternbotCache = {}
  PatternbotData = {}

  Jekyll::Hooks.register :site, :post_read do |site|
    PatternbotData[:css] = {}
    PatternbotData[:js] = {}
    PatternbotData[:logos] = {}
    PatternbotData[:icons] = {
      :spritesheets => [],
      :classes => [],
    }
    PatternbotData[:layouts] = []
    PatternbotData[:patterns] = {}
    PatternbotData[:patterns_order] = []
    PatternbotData[:pages] = []

    ConfigChangeParser.new.parse site

    # File.open('/Users/thomasjbradley/Desktop/patternbot-config.json', 'w') do |f|
    #   f.write(JSON.pretty_generate(Config))
    # end

    modulifier = ModulifierParser.new(Config['patternbot']['css']['modulifier'])
    PatternbotData[:css][:modulifier] = modulifier.exists? ? modulifier.info : {}

    gridifier = GridifierParser.new(Config['patternbot']['css']['gridifier'])
    PatternbotData[:css][:gridifier] = gridifier.exists? ? gridifier.info : {}

    typografier = TypografierParser.new(Config['patternbot']['css']['typografier'])
    PatternbotData[:css][:typografier] = typografier.exists? ? typografier.info : {}

    theme = ThemeParser.new(Config['patternbot']['css']['theme'])
    PatternbotData[:css][:theme] = theme.exists? ? theme.info : {}

    logos = LogosFinder.new(Config['patternbot']['logos'])
    PatternbotData[:logos] = logos.exists? ? logos.info : {}

    icon_files = IconsFinder.new(Config['patternbot']['icons'])
    if icon_files.exists?
      icons = IconsParser.new(Config['patternbot']['icons'], icon_files.info)
      PatternbotData[:icons][:spritesheets] = icons.info
      PatternbotData[:icons][:classes] = icons.classes
    else
      PatternbotData[:icons][:spritesheets] = []
      PatternbotData[:icons][:classes] = []
    end

    if File.exists? File.expand_path(Config['patternbot']['css']['main'], Config['patternbot']['css']['source'])
      PatternbotData[:css][:main] = true
    else
      PatternbotData[:css][:main] = false
    end

    if File.exists? File.expand_path(Config['patternbot']['js']['main'], Config['patternbot']['js']['source'])
      PatternbotData[:js][:main] = true
    else
      PatternbotData[:js][:main] = false
    end

    PatternbotData[:layouts] = LayoutsFinder.new.info
    PatternbotData[:includes] = IncludesFinder.new.info

    pattern_files = PatternsFinder.new
    PatternbotData[:patterns] = {
      :internal => pattern_files.internal_patterns_info,
      :user => pattern_files.user_patterns_info,
    }

    pages = SamplePagesFinder.new
    PatternbotData[:pages] = pages.info
    if PatternbotData[:pages].is_a? Array
      PatternbotData[:pages].sort_by!{ |p| p.downcase }
    end

    PatternbotData[:patterns_order] = PatternsOrderProcessor.new.process
    brand_processor = BrandProcessor.new.process
    modules_processor = ModulesProcessor.new.process
    icons_processor = IconsProcessor.new.process
    utilities_processor = UtilitiesProcessor.new.process

    # File.open('/Users/thomasjbradley/Desktop/patternbot.json', 'w') do |f|
    #   f.write(JSON.pretty_generate(PatternbotData))
    # end
  end

end
