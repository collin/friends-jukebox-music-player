class FollowMigration < ActiveRecord::Migration
  def self.up
    create_table :follows do |t|
      t.belongs_to :following, :null => false
      t.belongs_to :follower, :null => false
      t.boolean :reciprocated, :default => false, :null => false
      t.boolean :ignored, :default => false, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :follows
  end
end
