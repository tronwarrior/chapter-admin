# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dynamic_default_scoping/version"

Gem::Specification.new do |s|
  s.name        = "dynamic_default_scoping"
  s.version     = DynamicDefaultScoping::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ivan Ukhov"]
  s.email       = ["uvsoft@gmail.com"]
  s.homepage    = "https://github.com/UVSoft/dynamic_default_scoping"
  s.summary     = %q{Make ActiveRecord::Base.default_scope take a proc and have a name.}
  s.description = %q{Being included in a model, the library patches ActiveRecord::Base.default_scope to take a proc and have an optional name.}

  s.rubyforge_project = "dynamic_default_scoping"

  s.add_development_dependency 'mysql2', '~> 0.2.6'
  s.add_development_dependency 'rspec', '~> 2.4.0'

  s.add_dependency 'rails', '~> 3.0.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
