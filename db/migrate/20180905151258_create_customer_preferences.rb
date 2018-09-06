class CreateCustomerPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_preferences do |t|
      t.string :age
      t.string :species, array: true, default: []
      t.string :breed, array: true, default: []
      t.belongs_to :customer, index: true

      t.timestamps
    end
  end
end
