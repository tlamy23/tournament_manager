class Game < ActiveRecord::Base
  attr_accessible :week
  has_many :team_stats, :dependent => :destroy
  belongs_to :schedule
end
