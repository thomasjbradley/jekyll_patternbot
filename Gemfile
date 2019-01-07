source 'https://rubygems.org'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.5.3'

gem 'jekyll', '~> 3.8'
gem 'babosa'
gem 'deep_merge'
gem 'unicode_titlecase'
gem 'css_parser'
gem 'rgb'

group :jekyll_plugins do
  gem 'jekyll_patternbot_plugins', :path => File.expand_path('_plugins/', __dir__)
end

gemspec
