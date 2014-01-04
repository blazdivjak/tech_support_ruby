class RenameColumn < ActiveRecord::Migration
  def self.up
    rename_column :tickets, :type, :podrocje
  end
end
