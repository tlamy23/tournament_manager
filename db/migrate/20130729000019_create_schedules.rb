class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
