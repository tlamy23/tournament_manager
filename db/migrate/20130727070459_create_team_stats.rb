class CreateTeamStats < ActiveRecord::Migration
  def change
    create_table :team_stats do |t|
      t.integer :score
      t.string :result
      t.references :team
      t.references :game

      t.timestamps
    end
  end
end
