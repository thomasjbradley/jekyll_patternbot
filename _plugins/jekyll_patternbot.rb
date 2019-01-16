# frozen_string_literal: true

require 'open-uri'
require 'babosa'
require 'deep_merge'
require 'yaml'
require 'json'
require 'unicode_titlecase'
require 'css_parser'
require 'color_contrast_calc'

module JekyllPatternbot
  require_relative '../version.rb'
  require 'jekyll_patternbot/config'

  require 'jekyll_patternbot/loggers/patternbot'

  require 'jekyll_patternbot/helpers/file'
  require 'jekyll_patternbot/helpers/color'
  require 'jekyll_patternbot/helpers/jekyll'
  require 'jekyll_patternbot/helpers/pattern'

  require 'jekyll_patternbot/parsers/web_dev_tool'
  require 'jekyll_patternbot/parsers/modulifier'
  require 'jekyll_patternbot/parsers/gridifier'
  require 'jekyll_patternbot/parsers/typografier'
  require 'jekyll_patternbot/parsers/css_color'
  require 'jekyll_patternbot/parsers/css_font'
  require 'jekyll_patternbot/parsers/css_utility'
  require 'jekyll_patternbot/parsers/theme'
  require 'jekyll_patternbot/parsers/icons'

  require 'jekyll_patternbot/finders/finder'
  require 'jekyll_patternbot/finders/logos'
  require 'jekyll_patternbot/finders/icons'
  require 'jekyll_patternbot/finders/patterns'
  require 'jekyll_patternbot/finders/sample_pages'

  require 'jekyll_patternbot/processors/brand'
  require 'jekyll_patternbot/processors/modules'

  require 'jekyll_patternbot/hooks/pattern_lib'

  require 'jekyll_patternbot/tags/pattern'
  require 'jekyll_patternbot/tags/pattern_css'
  require 'jekyll_patternbot/tags/pattern_js'

  require 'jekyll_patternbot/filters/text'
  require 'jekyll_patternbot/filters/color'
  require 'jekyll_patternbot/filters/number'
  require 'jekyll_patternbot/filters/pattern'

  require 'jekyll_patternbot/generators/internal_patterns'
  require 'jekyll_patternbot/generators/user_patterns'
  require 'jekyll_patternbot/generators/pattern_lib'
end
