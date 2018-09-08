class CreateAdoptions < ActiveRecord::Migration[5.2]
  def change
    create_table :adoptions do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :pet, index: true

      t.timestamps
    end
  end
end
