class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :problem
      t.date :date
      t.string :type
      t.string :description
      t.string :phone
      t.integer :level
      t.integer :admin
      t.belongs_to :user
      t.string :state
      t.string :string

      t.timestamps
    end
  end
end
