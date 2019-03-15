class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.date :week_start
      t.date :week_end
    end
  end
end
