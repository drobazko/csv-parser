class AddWeekReferenceToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :week, index: true
  end
end
