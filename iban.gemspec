lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iban/version'

Gem::Specification.new do |s|
  s.name        = 'iban'
  s.version     = Iban::VERSION
  s.date        = '2019-05-13'
  s.summary     = 'Iban validation and bic detection'
  s.description = 'Methods for Iban validation and Bic detection'
  s.authors     = ['Heikki Poikela', 'Matilda Smeds']
  s.email       = 'foss@aavasoftware.com'
  s.files       = ['lib/iban.rb'] + Dir['lib/iban/*.rb']
  s.license     = 'MIT'
end
