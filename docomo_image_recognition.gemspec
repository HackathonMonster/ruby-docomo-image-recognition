$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'docomo_image_recognition/version'

Gem::Specification.new do |s|
  s.name        = 'docomo_image_recognition'
  s.version     = DocomoImageRecognition::VERSION
  s.authors     = ['Daniel Perez']
  s.email       = ['daniel@claudetech.com']
  s.homepage    = 'https://github.com/HackathonMonster/docomo-image-recognition'
  s.summary     = 'SDK for Docomo image recognition API'
  s.license     = 'MIT'

  s.files = Dir['{config,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['specs/**/*']

  s.add_dependency 'rest-client', '~> 1.7'
end
