$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require 'active_support/all'
require 'active_record'
require 'dynamic_default_scoping'

%w(models support).each do |directory|
  Dir[File.join(File.dirname(__FILE__), "#{ directory }/**/*.rb")].each do |file|
    require file
  end
end

RSpec.configure do |config|
  config.before(:each) do
    Post.unscoped.delete_all
  end
end
