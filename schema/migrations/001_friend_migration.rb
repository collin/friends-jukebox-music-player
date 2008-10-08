class FriendMigration < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.string :name, :null => false
      t.string :email, :null => false, :unique => true
      t.boolean :admin, :default => false
      t.string :crypted_password
      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end
