# frozen_string_literal: true

require 'jekyll'
require 'yaml'
require 'unicode_titlecase'

module JekyllPatternbot
  require 'jekyll-patternbot-plugins/config'

  require 'jekyll-patternbot-plugins/helpers/file'
  require 'jekyll-patternbot-plugins/helpers/jekyll'
  require 'jekyll-patternbot-plugins/helpers/pattern'

  require 'jekyll-patternbot-plugins/pattern-lib'

  require 'jekyll-patternbot-plugins/user-patterns/patterns'
  require 'jekyll-patternbot-plugins/user-patterns/html'

  require 'jekyll-patternbot-plugins/tags/pattern'
  require 'jekyll-patternbot-plugins/tags/pattern_css'
  require 'jekyll-patternbot-plugins/tags/pattern_js'
end
