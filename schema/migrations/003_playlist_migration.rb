class PlaylistMigration < ActiveRecord::Migration
  def self.up
    create_table :playlists do |t|
      t.belongs_to :friend
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :playlists
  end
end
