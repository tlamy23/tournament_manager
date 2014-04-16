class TeamStat < ActiveRecord::Base
  attr_accessible :score, :result, :player_stats_attributes, :team, :player_stats
  belongs_to :game
  belongs_to :team
  has_many :player_stats, :dependent => :destroy
  before_save :set_team_data
  # validates :team_score

  accepts_nested_attributes_for :player_stats

  private
  def set_team_data
    puts "entre team_stats"
    team_score = 0
    self.player_stats.each { |player| team_score += (player.points.present? ? player.points : 0) }
    self.score = team_score
  end
  # def team_score
  #   playe_score = 0
  #   self.player_stats.each {|player| player_score += player.points}

  #   errors.add(:team_stat, t("game_form.invalid_team_score")) unless
  #   player_score == self.score
  # end
end
