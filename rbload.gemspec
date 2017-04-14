name = "rbload"
$LOAD_PATH << File.expand_path('../lib', __FILE__)
require "#{name}/version"

Gem::Specification.new name, RBLoad::VERSION do |s|
  s.summary = "Smart load tester"
  s.authors = ["Fabio Santos"]
  s.email = "flsusp@gmail.com"
  s.homepage = "https://github.com/flsusp/#{name}"
  s.files = `git ls-files bin lib LICENSE`.split("\n")
  s.license = "MIT"
  s.required_ruby_version = '>= 2.3.3'
end
