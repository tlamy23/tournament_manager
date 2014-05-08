class DashboardController < ApplicationController
  def standings
    @teams_weight = Team.all :select => 'teams.name, SUM(players.weight) as weight_sum',
                             :joins => :players,
                             :group => 'teams.id',
                             :order => 'weight_sum DESC'

    @teams_height = Team.all :select => 'teams.name, SUM(players.height) as height_sum',
                             :joins => :players,
                             :group => 'teams.id',
                             :order => 'height_sum DESC'
    @stats = Game.stats
  end
end


 #Game.joins(:team_stats => { :team => :team_seasons })
 #    .select("team_stats.team_id as id,
 #            teams.name as name,
 #            team_seasons.id as team_season_id,
 #            SUM(CASE WHEN team_stats.result = 'Won' THEN 1 ELSE 0 END) AS won,
 #            SUM(CASE WHEN team_stats.result = 'Lost' THEN 1 ELSE 0 END) AS lost,
 #            COUNT(*) as total")
 #   .where('games.tournament_id = ?', self.id )
 #   .where('team_seasons.tournament_id = ?', self.id )
 #   .where('games.played = true')
 #   .group('team_stats.team_id,
 #           team_seasons.id,
 #          teams.name,
 #          games.tournament_id')
 #   .order('won DESC')