class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :preference, index: true, foreign_key: { to_table: :customer_preferences }

      t.timestamps
    end
  end
end
