class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.index :id, unique: true
      
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
