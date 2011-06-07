ActiveRecord::Base.establish_connection \
  :adapter  => 'mysql2',
  :hostname => 'localhost',
  :database => 'dynamic_default_scoping',
  :username => 'root',
  :password => ''

connection = ActiveRecord::Base.connection

ActiveRecord::Base.descendants.each do |model|
  table_name = model.table_name
  connection.drop_table table_name if connection.table_exists? table_name
  table = File.join File.dirname(__FILE__), '..', "tables/#{ table_name }.rb"
  connection.instance_eval File.open(table).read if File.exist? table
end
