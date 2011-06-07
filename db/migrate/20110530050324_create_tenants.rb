class CreateTenants < ActiveRecord::Migration
  def self.up
    create_table :tenants do |t|
      t.string :name
      t.string :accounting
      t.string :metadata

      t.timestamps
    end
  end

  def self.down
    drop_table :tenants
  end
end
