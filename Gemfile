source 'https://rubygems.org'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.5.3'

gem 'jekyll', '~> 3.8'
gem 'unicode_titlecase'

group :jekyll_plugins do
  gem 'jekyll-patternbot-plugins', :path => File.expand_path('_plugins/', __dir__)
end

gemspec
