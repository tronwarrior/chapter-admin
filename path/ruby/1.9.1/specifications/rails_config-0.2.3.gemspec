# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails_config}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacques Crocker", "Fred Wu"]
  s.date = %q{2011-04-08}
  s.description = %q{Easy to use Settings helper that loads its data in from config/settings.yml. Handles adding multiple sources, and easy reloading.}
  s.email = ["railsjedi@gmail.com", "ifredwu@gmail.com"]
  s.files = ["spec/fixtures/bool_override/config1.yml", "spec/fixtures/bool_override/config2.yml", "spec/fixtures/custom_types/hash.yml", "spec/fixtures/deep_merge/config1.yml", "spec/fixtures/deep_merge/config2.yml", "spec/fixtures/deep_merge2/config1.yml", "spec/fixtures/deep_merge2/config2.yml", "spec/fixtures/development.yml", "spec/fixtures/empty1.yml", "spec/fixtures/empty2.yml", "spec/fixtures/settings.yml", "spec/fixtures/settings2.yml", "spec/fixtures/with_erb.yml", "spec/rails_config_spec.rb", "spec/sources/yaml_source_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/railsjedi/rails_config}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Provides a Settings helper for rails3 that reads from config/settings.yml}
  s.test_files = ["spec/fixtures/bool_override/config1.yml", "spec/fixtures/bool_override/config2.yml", "spec/fixtures/custom_types/hash.yml", "spec/fixtures/deep_merge/config1.yml", "spec/fixtures/deep_merge/config2.yml", "spec/fixtures/deep_merge2/config1.yml", "spec/fixtures/deep_merge2/config2.yml", "spec/fixtures/development.yml", "spec/fixtures/empty1.yml", "spec/fixtures/empty2.yml", "spec/fixtures/settings.yml", "spec/fixtures/settings2.yml", "spec/fixtures/with_erb.yml", "spec/rails_config_spec.rb", "spec/sources/yaml_source_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
      s.add_development_dependency(%q<autotest>, [">= 0"])
      s.add_development_dependency(%q<growl-glue>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
      s.add_dependency(%q<autotest>, [">= 0"])
      s.add_dependency(%q<growl-glue>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 3.0"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
    s.add_dependency(%q<autotest>, [">= 0"])
    s.add_dependency(%q<growl-glue>, [">= 0"])
  end
end
