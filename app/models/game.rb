class Game < ActiveRecord::Base
  attr_accessible :week, :schedule_id, :team_stats_attributes
  has_many :team_stats, :dependent => :destroy
  belongs_to :schedule
  after_save :set_game_winner

  accepts_nested_attributes_for :team_stats
  def self.win(team_id)
    Game.joins(:team_stats).where(team_stats: {team_id: team_id, result:'Won'})
  end

  def self.lost(team_id)
    Game.joins(:team_stats).where(team_stats: {team_id: team_id, result:'Lost'})
  end

  def self.stats
    Schedule.joins(:games => {:team_stats => :team})
       .select("team_stats.team_id as id,
               teams.name,
               SUM(CASE WHEN team_stats.result = 'Won' THEN 1 ELSE 0 END) AS won,
               SUM(CASE WHEN team_stats.result = 'Lost' THEN 1 ELSE 0 END) AS lost,
               COUNT(*) as total")
      .where("schedules.date BETWEEN '2014-01-01' AND current_date")
      .group('team_stats.team_id,
             teams.name')
      .order('won DESC, lost ASC')
  end
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
