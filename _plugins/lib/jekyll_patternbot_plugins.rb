# frozen_string_literal: true

require 'open-uri'
require 'jekyll'
require 'babosa'
require 'deep_merge'
require 'yaml'
require 'json'
require 'unicode_titlecase'
require 'css_parser'
require 'color_contrast_calc'

module JekyllPatternbot
  require 'jekyll_patternbot_plugins/config'

  require 'jekyll_patternbot_plugins/helpers/file'
  require 'jekyll_patternbot_plugins/helpers/color'
  require 'jekyll_patternbot_plugins/helpers/jekyll'
  require 'jekyll_patternbot_plugins/helpers/pattern'

  require 'jekyll_patternbot_plugins/parsers/web_dev_tool'
  require 'jekyll_patternbot_plugins/parsers/modulifier'
  require 'jekyll_patternbot_plugins/parsers/gridifier'
  require 'jekyll_patternbot_plugins/parsers/typografier'
  require 'jekyll_patternbot_plugins/parsers/css_color'
  require 'jekyll_patternbot_plugins/parsers/css_font'
  require 'jekyll_patternbot_plugins/parsers/css_utility'
  require 'jekyll_patternbot_plugins/parsers/theme'
  require 'jekyll_patternbot_plugins/parsers/icons'

  require 'jekyll_patternbot_plugins/finders/finder'
  require 'jekyll_patternbot_plugins/finders/logos'
  require 'jekyll_patternbot_plugins/finders/icons'
  require 'jekyll_patternbot_plugins/finders/patterns'
  require 'jekyll_patternbot_plugins/finders/sample_pages'

  require 'jekyll_patternbot_plugins/hooks/pattern_lib'

  require 'jekyll_patternbot_plugins/tags/pattern'
  require 'jekyll_patternbot_plugins/tags/pattern_css'
  require 'jekyll_patternbot_plugins/tags/pattern_js'

  require 'jekyll_patternbot_plugins/filters/text'
  require 'jekyll_patternbot_plugins/filters/color'
  require 'jekyll_patternbot_plugins/filters/number'
  require 'jekyll_patternbot_plugins/filters/pattern'

  require 'jekyll_patternbot_plugins/generators/internal_patterns'
  require 'jekyll_patternbot_plugins/generators/user_patterns'
  require 'jekyll_patternbot_plugins/generators/pattern_lib'
end
