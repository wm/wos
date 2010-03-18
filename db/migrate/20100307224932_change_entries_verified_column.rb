class ChangeEntriesVerifiedColumn < ActiveRecord::Migration
  def self.up
    change_column :entries, :verified, :boolean, :default => false
  end

  def self.down
  end
end
