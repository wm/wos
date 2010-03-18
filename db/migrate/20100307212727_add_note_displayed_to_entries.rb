class AddNoteDisplayedToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :note_displayed, :boolean, :default => false
  end

  def self.down
    remove_column :entries, :note_displayed
  end
end
