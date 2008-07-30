class CreateUsers < Sequel::Migration
  def up
    create_table :users do
      primary_key :id
      varchar :name, :unique => true, :required => true
      varchar :hash
    end
  end

  def down
    execute 'DROP_TABLE users'
  end
end