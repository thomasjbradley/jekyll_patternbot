# frozen_string_literal: true

require 'jekyll'
require 'jekyll-patternbot/version'

module JekyllPatternbot
  autoload :PatternTag, 'jekyll-patternbot/pattern-tag.rb'
end

Liquid::Template.register_tag('pattern', JekyllPatternbot::PatternTag)
