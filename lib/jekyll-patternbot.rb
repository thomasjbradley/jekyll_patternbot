# frozen_string_literal: true

require 'jekyll'

module JekyllPatternbot
  require 'jekyll-patternbot/version'
  require 'jekyll-patternbot/settings'
  require 'jekyll-patternbot/hooks'
  require 'jekyll-patternbot/generators'
  require 'jekyll-patternbot/tags'
end

Liquid::Template.register_tag('pattern', JekyllPatternbot::PatternTag)
