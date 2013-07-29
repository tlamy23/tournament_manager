class PlayerStat < ActiveRecord::Base
  attr_accessible :points, :fouls, :player
  belongs_to :player
  belongs_to :team_stat
end
