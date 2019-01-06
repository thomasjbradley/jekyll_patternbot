# frozen_string_literal: true

require 'jekyll'
require 'yaml'
require 'unicode_titlecase'

module JekyllPatternbot
  require 'jekyll_patternbot_plugins/config'

  require 'jekyll_patternbot_plugins/helpers/file'
  require 'jekyll_patternbot_plugins/helpers/jekyll'
  require 'jekyll_patternbot_plugins/helpers/pattern'

  require 'jekyll_patternbot_plugins/parsers/web_dev_tool'
  require 'jekyll_patternbot_plugins/parsers/modulifier'
  require 'jekyll_patternbot_plugins/parsers/gridifier'
  require 'jekyll_patternbot_plugins/parsers/typografier'
  require 'jekyll_patternbot_plugins/parsers/css_variable'
  require 'jekyll_patternbot_plugins/parsers/css_font'
  require 'jekyll_patternbot_plugins/parsers/theme'
  # require 'jekyll_patternbot_plugins/parsers/icons'

  require 'jekyll_patternbot_plugins/pattern_lib'

  require 'jekyll_patternbot_plugins/user_patterns/patterns'
  require 'jekyll_patternbot_plugins/user_patterns/html'

  require 'jekyll_patternbot_plugins/tags/pattern'
  require 'jekyll_patternbot_plugins/tags/pattern_css'
  require 'jekyll_patternbot_plugins/tags/pattern_js'
end
