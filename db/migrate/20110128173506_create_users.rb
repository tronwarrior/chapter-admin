class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :fname, :null => false
      t.string :lname, :null => false
      t.string :email, :null => false
      t.string :membership_identifier, :null => false
      t.boolean :validated, :null => false, :default => false
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token, :null => false
      t.integer :login_count, :null => false, :default => 0
      t.integer :failed_login_count, :null => false, :default => 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip

      t.timestamps
    end

    add_index :users, :email
    add_index :users, :membership_identifier
  end

  def self.down
    drop_table :users
  end
end
