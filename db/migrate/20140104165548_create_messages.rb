class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.datetime :date
      t.string :user
      t.integer :privilegelvl
      t.belongs_to :ticket

      t.timestamps
    end
  end
end
