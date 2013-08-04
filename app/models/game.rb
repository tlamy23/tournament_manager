class Game < ActiveRecord::Base
  attr_accessible :week, :schedule_id, :team_stats_attributes
  has_many :team_stats, :dependent => :destroy
  belongs_to :schedule

  accepts_nested_attributes_for :team_stats
end
