require 'yaml'

config = YAML.load_file(File.expand_path('../_config.yml', __dir__))

Gem::Specification.new do |spec|
  spec.name          = 'jekyll_patternbot_plugins'
  spec.version       = config['patternbot']['version']
  spec.authors       = ['Thomas J Bradley']
  spec.email         = ['hey@thomasjbradley.ca']

  spec.summary       = 'Your pompous and persnickety patterning robot.'
  spec.description   = 'A Jekyll plugin for developing pattern libraries & style guides that can be used to generate a Jekyll website.'
  spec.homepage      = 'https://github.com/thomasjbradley/jekyll_patternbot/'
  spec.license       = 'MIT'
end
