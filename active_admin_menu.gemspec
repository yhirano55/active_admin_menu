# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_admin_menu/version"

Gem::Specification.new do |gem|
  gem.name          = "active_admin_menu"
  gem.version       = ActiveAdminMenu::VERSION
  gem.authors       = ["Yoshiyuki Hirano"]
  gem.email         = ["yhirano@me.com"]

  gem.summary       = "manage menu with YAML for Active Admin"
  gem.description   = gem.summary
  gem.homepage      = "https://github.com/yhirano55/active_admin_menu"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  gem.bindir        = "bin"
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.1.0"
  gem.add_runtime_dependency "activeadmin", "~> 1.0.0.pre4"

  gem.add_development_dependency "bundler", "~> 1.13"
  gem.add_development_dependency "rake",    "~> 10.0"
  gem.add_development_dependency "rspec",   "~> 3.0"
  gem.add_development_dependency "pry",     "~> 0.10.0"
  gem.add_development_dependency "rubocop", "~> 0.40.0"
end
