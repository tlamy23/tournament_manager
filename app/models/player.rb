class Player < ActiveRecord::Base
  attr_accessible :first_name, :height, :last_name, :nickname, :weight, :team_id

  belongs_to :team
  has_many :player_stats
end
