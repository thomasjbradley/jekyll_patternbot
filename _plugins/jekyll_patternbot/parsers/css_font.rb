module JekyllPatternbot
  class CSSFontParser

    def self.base
      {
        :primary => false,
        :secondary => false,
        :tertiary => false,
        :accent => [],
      }
    end

    def self.font
      {
        :name => nil,
        :name_pretty => nil,
        :css_name => nil,
        :raw => nil,
        :var => nil,
        :weights => nil,
      }
    end

    def self.font_weight
      {
        :css_name => nil,
        :weight => 'normal',
        :has_normal => false,
        :has_italic => false,
      }
    end

    def self.is_font?(dec)
      !!dec.match(/\-\-font\-/)
    end

    def self.normalize_font_weight(font_weight)
      font_weight_digits = font_weight.gsub /[^\d]/, ''
      return 'normal' if font_weight_digits == '400'
      return 'bold' if font_weight_digits == '700'
      return font_weight_digits
    end

    def self.rule_sets_to_weights(rulesets)
      weights = {}
      rulesets.each do |ruleset|
        font_family = ruleset.get_value('font-family').gsub(/['";]/, '')
        font_family_slug = font_family.force_encoding("utf-8").to_slug.normalize.to_s
        weights[font_family_slug] = {} unless weights.key? font_family_slug
        font_weight = self.normalize_font_weight ruleset.get_value 'font-weight'
        weights[font_family_slug][font_weight] = self.font_weight.clone unless weights[font_family_slug].key? font_weight
        weights[font_family_slug][font_weight][:weight] = font_weight
        weights[font_family_slug][font_weight][:css_name] = ruleset.get_value('font-family').gsub(/\;/, '').strip
        weights[font_family_slug][font_weight][:has_normal] = true if ruleset.get_value('font-style').match /normal/ or ruleset.get_value('font-style').nil?
        weights[font_family_slug][font_weight][:has_italic] = true if ruleset.get_value('font-style').match /italic/
      end
      weights
    end

    def self.default_weights(font)
      weights = {
        'normal' => self.font_weight.clone,
        'bold' => self.font_weight.clone,
      }
      weights['normal'][:css_name] = font[:css_name]
      weights['normal'][:has_normal] = true
      weights['normal'][:has_italic] = true
      weights['bold'][:weight] = 'bold'
      weights['bold'][:css_name] = font[:css_name]
      weights['bold'][:has_normal] = true
      weights
    end

    def self.parse_font_file(font_url)
      if font_url and not font_url.strip.empty?
        parser = CssParser::Parser.new
        parser.load_uri!(font_url)
        font_face_rulesets = parser.find_by_selector('@font-face').map { |rules| CssParser::RuleSet.new(nil, rules) }
        return nil unless font_face_rulesets
        return self.rule_sets_to_weights font_face_rulesets
      else
        return false
      end
    end

    def self.parse_font(dec, val, available_weights)
      if not val.is_a? String
        err_msg = "There’s a syntax error in the #{dec.strip} declaration of the css/theme.css file."
        err_logger = PatternbotConsoleLogger.new
        err_logger.fatal err_msg
        raise err_msg
      end
      font_family = val.match(/[^\,\;]*/)[0].gsub(/['"]/, '')
      font_family_slug = font_family.force_encoding("utf-8").to_slug.normalize.to_s
      font = self.font.clone
      font[:name] = font_family_slug
      font[:name_pretty] = font_family
      font[:raw] = val
      font[:var] = dec
      font[:css_name] = font_family
      if available_weights and available_weights.key? font_family_slug
        font[:weights] = available_weights[font_family_slug]
        font[:css_name] = available_weights[font_family_slug].values[0][:css_name]
      end
      font[:weights] = self.default_weights(font) unless font[:weights]
      font
    end

    def self.parse_fonts(data, available_weights=false)
      fonts = self.base.clone
      data.each do |dec, val|
        if self.is_font? dec
          fonts[:primary] = self.parse_font(dec, val, available_weights) if dec.match(/^\-\-font\-primary/)
          fonts[:secondary] = self.parse_font(dec, val, available_weights) if dec.match(/^\-\-font\-secondary/)
          fonts[:tertiary] = self.parse_font(dec, val, available_weights) if dec.match(/^\-\-font\-tertiary/)
          fonts[:accent].push self.parse_font(dec, val, available_weights) unless dec.match(/^\-\-font\-(primary|secondary|tertiary)/)
        end
      end
      fonts
    end

    def self.parse(font_url, data)
      if font_url and not font_url.strip.empty?
        unless PatternbotCache.key?(font_url)
          PatternbotCache[font_url] = self.parse_font_file(font_url)
          PatternbotLogger.warn("Patternbot downloaded CSS for fonts from the remote URL: #{font_url}")
        else
          PatternbotLogger.info("Patternbot used a cached version of the font CSS originally located at: #{font_url}")
        end
        return self.parse_fonts data, PatternbotCache[font_url]
      else
        return self.parse_fonts data
      end
    end

  end
end
