class CreatePlayerStats < ActiveRecord::Migration
  def change
    create_table :player_stats do |t|
      t.integer :points
      t.integer :fouls
      t.references :player
      t.references :team_stat

      t.timestamps
    end
  end
end
