class TeamStat < ActiveRecord::Base
  attr_accessible :score, :result, :player_stats_attributes, :team
  belongs_to :game
  belongs_to :team
  has_many :player_stats, :dependent => :destroy
  # validates :team_score

  accepts_nested_attributes_for :player_stats

  private
  # def team_score
  #   playe_score = 0
  #   self.player_stats.each {|player| player_score += player.points}

  #   errors.add(:team_stat, t("game_form.invalid_team_score")) unless
  #   player_score == self.score
  # end
end
