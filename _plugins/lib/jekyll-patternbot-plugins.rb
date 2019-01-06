# frozen_string_literal: true

require 'jekyll'
require 'yaml'
require 'unicode_titlecase'

module JekyllPatternbot
  require 'jekyll-patternbot-plugins/config'
  require 'jekyll-patternbot-plugins/file-helpers'
  require 'jekyll-patternbot-plugins/jekyll-helpers'
  require 'jekyll-patternbot-plugins/patterns'
  require 'jekyll-patternbot-plugins/hooks'
  require 'jekyll-patternbot-plugins/pattern-html'
  require 'jekyll-patternbot-plugins/pattern-css'
  require 'jekyll-patternbot-plugins/pattern-js'
  require 'jekyll-patternbot-plugins/generators'
  require 'jekyll-patternbot-plugins/tags'
end

Liquid::Template.register_tag('pattern', JekyllPatternbot::PatternTag)
Liquid::Template.register_tag('pattern_css', JekyllPatternbot::PatternCSSTag)
Liquid::Template.register_tag('pattern_js', JekyllPatternbot::PatternJSTag)
