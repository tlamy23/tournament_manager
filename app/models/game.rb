class Game < ActiveRecord::Base
  attr_accessible :week, :schedule_id, :team_stats_attributes
  has_many :team_stats, :dependent => :destroy
  belongs_to :schedule
  after_save :set_game_winner

  accepts_nested_attributes_for :team_stats

  private
  def set_game_winner
    team_a = self.team_stats[0]
    team_b = self.team_stats[1]

    if team_a.score > team_b.score
      team_a.result = 'Won'
      team_b.result = 'Lost'
    else
      team_a.result = 'Lost'
      team_b.result = 'Won'
    end

    team_a.save
    team_b.save
  end
end
