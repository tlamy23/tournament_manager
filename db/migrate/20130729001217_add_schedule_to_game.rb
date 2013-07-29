class AddScheduleToGame < ActiveRecord::Migration
  def change
    remove_column :games, :week
    add_column :games, :schedule_id, :integer
  end
end
