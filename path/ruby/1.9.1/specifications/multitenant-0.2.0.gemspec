# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{multitenant}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Sonnek"]
  s.date = %q{2011-02-06}
  s.description = %q{never let an unscoped Model.all accidentally leak data to an unintended audience.}
  s.email = %q{ryan@codecrate.com}
  s.files = ["spec/multitenant_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/wireframe/multitenant}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{scope database queries to current tenant}
  s.test_files = ["spec/multitenant_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<multitenant>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.3"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.3"])
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0.3"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0.3"])
      s.add_runtime_dependency(%q<dynamic_default_scoping>, ["~> 0.0.3"])
    else
      s.add_dependency(%q<multitenant>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.3"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.3"])
      s.add_dependency(%q<activerecord>, ["~> 3.0.3"])
      s.add_dependency(%q<activesupport>, ["~> 3.0.3"])
      s.add_dependency(%q<dynamic_default_scoping>, ["~> 0.0.3"])
    end
  else
    s.add_dependency(%q<multitenant>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.3"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.3"])
    s.add_dependency(%q<activerecord>, ["~> 3.0.3"])
    s.add_dependency(%q<activesupport>, ["~> 3.0.3"])
    s.add_dependency(%q<dynamic_default_scoping>, ["~> 0.0.3"])
  end
end
