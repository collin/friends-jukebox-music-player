class SongMigration < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.belongs_to :playlist
      t.string :uri, :null => false
      t.integer :position, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
