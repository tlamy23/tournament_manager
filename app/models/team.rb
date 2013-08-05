class Team < ActiveRecord::Base
  attr_accessible :name, :color
  has_many :players
  has_many :team_stats
  validates :name, :presence => true
end
