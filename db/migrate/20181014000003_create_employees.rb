class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.references :coffeeshop, foreign_key: true
      t.text :identifier
      t.text :name
      t.timestamps(default: -> { 'CURRENT_TIMESTAMP' })
    end
  end
end
