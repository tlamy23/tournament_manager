class DashboardController < ApplicationController
  def standings
    @points = Player.all :select => 'players.id as id, players.first_name, players.nickname, SUM(player_stats.points) as points_sum, SUM(player_stats.fouls) as fouls_sum',
                             :joins => 'full outer join player_stats on players.id=player_stats.player_id',
                             :group => 'players.id, players.first_name, players.nickname',
                             :order => 'points_sum DESC',
                             :limit => 5

    @fouls = Player.all :select => 'players.id as id, players.first_name, players.nickname, SUM(player_stats.points) as points_sum, SUM(player_stats.fouls) as fouls_sum',
                             :joins => 'full outer join player_stats on players.id=player_stats.player_id',
                             :group => 'players.id, players.first_name, players.nickname',
                             :order => 'fouls_sum DESC',
                             :limit => 5

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