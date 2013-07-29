class TeamStat < ActiveRecord::Base
  attr_accessible :score, :result, :player_stats, :team
  belongs_to :game
  belongs_to :team
  has_many :player_stats, :dependent => :destroy
end
