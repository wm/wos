class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :username
      t.string :password
      t.string :domain
      t.string :protocol
      t.string :mac
      t.text :note
      t.boolean :verified

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
