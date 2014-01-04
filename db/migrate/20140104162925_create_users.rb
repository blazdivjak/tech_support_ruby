class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.integer :privilegelvl
      t.string :phone
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
