class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :coffeeshop, foreign_key: true, null: false
      t.references :employee, foreign_key: true, null: false
      t.references :coffee, foreign_key: true, null: false
      t.numeric :price, null: false
      t.timestamp :sold_at, null: false

      t.timestamps(default: -> { 'CURRENT_TIMESTAMP' })
    end
  end
end
