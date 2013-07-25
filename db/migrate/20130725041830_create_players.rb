class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.decimal :height
      t.decimal :weight
      t.references :team

      t.timestamps
    end
  end
end
