require File.join(File.dirname(__FILE__), "lib", "active_admin_menu", "version")

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
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.1.0"

  gem.add_dependency "activeadmin", ">= 1.0.0.pre4"
end
