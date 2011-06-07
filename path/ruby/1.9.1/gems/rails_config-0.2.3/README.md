# RailsConfig

## Summary

RailsConfig helps you easily manage environment specific Rails settings in an easy and usable manner

## Features

* simple YAML config files
* config files support ERB
* config files support inheritance
* access config information via convenient object member notation

## Compatibility

* Rails 3.0
* Padrino
* Sinatra

For older versions of Rails and other Ruby apps, use [AppConfig](http://github.com/fredwu/app_config).

## Installing on Rails 3

Add this to your `Gemfile`:

    gem "rails_config"


## Installing on Padrino

Add this to your `Gemfile`:

    gem "rails_config"

in your app.rb, you'll also need to register RailsConfig

    register RailsConfig


## Installing on Sinatra

Add this to your `Gemfile`:

    gem "rails_config"

in your app, you'll need to register RailsConfig. You'll also need to give it a root so it can find the config files.

    set :root, File.dirname(__FILE__)
    register RailsConfig

It's also possible to initialize it manually within your configure block if you want to just give it some yml paths to load from.

    RailsConfig.load_and_set_settings("/path/to/yaml1", "/path/to/yaml2", ...)


## Customizing RailsConfig

You may customize the behavior of RailsConfig by generating an initializer file:

    rails g rails_config:install

This will generate `config/initializers/rails_config.rb` with a set of default settings as well as to generate a set of default settings files:

    config/settings.yml
    config/settings/development.yml
    config/settings/production.yml
    config/settings/test.yml

## Accessing the Settings object

After installing this plugin, the `Settings` object will be available globally. Entries are accessed via object member notation:

    Settings.my_config_entry

Nested entries are supported:

    Settings.my_section.some_entry

If you have set a different constant name for the object in the initializer file, use that instead.

## Common config file

Config entries are compiled from:

    config/settings.yml
    config/settings/#{environment}.yml
    config/environments/#{environment}.yml

Settings defined in files that are lower in the list override settings higher.

### Reloading settings

You can reload the Settings object at any time by running `Settings.reload!`.

### Reloading settings and config files

You can also reload the `Settings` object from different config files at runtime.

For example, in your tests if you want to test the production settings, you can:

    Rails.env = "production"
    Settings.reload_from_files(
      Rails.root.join("config", "settings.yml").to_s,
      Rails.root.join("config", "settings", "#{Rails.env}.yml").to_s,
      Rails.root.join("config", "environments", "#{Rails.env}.yml").to_s
    )

### Environment specific config files

You can have environment specific config files. Environment specific config entries take precedence over common config entries.

Example development environment config file:

    #{Rails.root}/config/environments/development.yml

Example production environment config file:

    #{Rails.root}/config/environments/production.yml

### Adding sources at Runtime

You can add new YAML config files at runtime. Just use:

    Settings.add_source!("/path/to/source.yml")
    Settings.reload!

This will use the given source.yml file and use its settings to overwrite any previous ones.

One thing I like to do for my Rails projects is provide a local.yml config file that is .gitignored (so its independent per developer). Then I create a new initializer in `config/initializers/add_local_config.rb` with the contents

    Settings.add_source!("#{Rails.root}/config/settings/local.yml")
    Settings.reload!

## Embedded Ruby (ERB)

Embedded Ruby is allowed in the configuration files. See examples below.

## Accessing Configuration Settings

Consider the two following config files.

 #{Rails.root}/config/settings.yml:

    size: 1
    server: google.com

 #{Rails.root}/config/environments/development.yml:

    size: 2
    computed: <%= 1 + 2 + 3 %>
    section:
      size: 3
      servers: [ {name: yahoo.com}, {name: amazon.com} ]

Notice that the environment specific config entries overwrite the common entries.

    Settings.size   # => 2
    Settings.server # => google.com

Notice the embedded Ruby.

    Settings.computed # => 6

Notice that object member notation is maintained even in nested entries.

    Settings.section.size # => 3

Notice array notation and object member notation is maintained.

    Settings.section.servers[0].name # => yahoo.com
    Settings.section.servers[1].name # => amazon.com

## Authors

* [Jacques Crocker](http://github.com/railsjedi)
* [Fred Wu](http://github.com/fredwu)
* Inherited from [AppConfig](http://github.com/cjbottaro/app_config) by [Christopher J. Bottaro](http://github.com/cjbottaro)