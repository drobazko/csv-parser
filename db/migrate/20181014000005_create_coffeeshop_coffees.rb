class CreateCoffeeshopCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffeeshop_coffees do |t|
      t.references :coffeeshop, foreign_key: true
      t.references :coffee, foreign_key: true
      t.text :identifier

      t.timestamps(default: -> { 'CURRENT_TIMESTAMP' })
    end
  end
end
