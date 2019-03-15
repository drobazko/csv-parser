class CreateCoffeeshops < ActiveRecord::Migration[5.2]
  def change
    create_table :coffeeshops do |t|
      t.text :identifier
      t.text :name
      t.timestamps(default: -> { 'CURRENT_TIMESTAMP' })
    end
  end
end
