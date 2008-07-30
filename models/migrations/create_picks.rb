class CreatePicks < Sequel::Migration
  def up
    create_table :picks do
      primary_key :id
      integer :song_id
      integer :user_id
      datetime :created_at
    end
  end

  def down
    execute 'DROP_TABLE picks'
  end
end