# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'auto_select2_tag/version'

Gem::Specification.new do |spec|
  spec.name          = 'auto_select2_tag'
  spec.version       = AutoSelect2Tag::VERSION
  spec.authors       = ["Dmitriy Lisichkin", "Ivan Zabrovskiy"]
  spec.email         = ["dima@sb42.ru", "lorowar@gmail.com"]
  spec.summary       = %q{Provide tag-helper methods for create Select2 elements by the same way as any other elements}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/Loriowar/auto_select2_tag"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 3.1"
  spec.add_dependency 'select2-rails'
  spec.add_dependency 'coffee-rails'
  spec.add_dependency 'auto_select2', '>= 0.2.1'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", "~> 3.2.12"
end
