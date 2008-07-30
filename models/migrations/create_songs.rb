class CreateSong < Sequel::Migration
  def up
    create_table :songs do
      primary_key :id
      string :url
    end
  end

  def down
    execute 'DROP_TABLE songs'
  end
end