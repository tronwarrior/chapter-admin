# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dynamic_default_scoping}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ivan Ukhov"]
  s.date = %q{2011-02-08}
  s.description = %q{Being included in a model, the library patches ActiveRecord::Base.default_scope to take a proc and have an optional name.}
  s.email = ["uvsoft@gmail.com"]
  s.files = ["spec/models/post.rb", "spec/spec_helper.rb", "spec/support/connection.rb", "spec/support/matchers.rb", "spec/tables/posts.rb", "spec/unit/dynamic_default_scoping_spec.rb"]
  s.homepage = %q{https://github.com/UVSoft/dynamic_default_scoping}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{dynamic_default_scoping}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Make ActiveRecord::Base.default_scope take a proc and have a name.}
  s.test_files = ["spec/models/post.rb", "spec/spec_helper.rb", "spec/support/connection.rb", "spec/support/matchers.rb", "spec/tables/posts.rb", "spec/unit/dynamic_default_scoping_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mysql2>, ["~> 0.2.6"])
      s.add_development_dependency(%q<rspec>, ["~> 2.4.0"])
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.3"])
    else
      s.add_dependency(%q<mysql2>, ["~> 0.2.6"])
      s.add_dependency(%q<rspec>, ["~> 2.4.0"])
      s.add_dependency(%q<rails>, ["~> 3.0.3"])
    end
  else
    s.add_dependency(%q<mysql2>, ["~> 0.2.6"])
    s.add_dependency(%q<rspec>, ["~> 2.4.0"])
    s.add_dependency(%q<rails>, ["~> 3.0.3"])
  end
end
