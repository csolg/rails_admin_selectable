# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin_selectable/version'

Gem::Specification.new do |gem|
  gem.name          = "rails_admin_selectable"
  gem.version       = RailsAdminSelectable::VERSION
  gem.authors       = ["Gleb Tv", "Oleg Bavaev"]
  gem.email         = ["glebtv@gmail.com", "csolg7@gmail.com"]
  gem.description   = %q{Selectable field from index view for rails admin}
  gem.summary       = %q{Make any association field easily selectable from index view in rails admin}
  gem.homepage      = "https://github.com/jesson/rails_admin_selectable"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rails_admin"

  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rake"
end

