class ActionsHelperController < ApplicationController
  before_filter :authenticate_user!

  def generate_games
    Game.destroy_all
    TeamStat.destroy_all
    PlayerStat.destroy_all

    @teams = Team.all

    @teams.each do |team|
      @oponnents = Team.all
      @oponnents.each do |oponnent|
        if oponnent.id != team.id && !game_exists([team.id, oponnent.id])
          game = Game.new
          game.team_stats << TeamStat.new( :team => team, :player_stats => get_players_stats(team))
          game.team_stats << TeamStat.new( :team => oponnent, :player_stats => get_players_stats(oponnent))
          game.save!
        end
      end
    end
  end

  private
  def get_players_stats(team)
    player_stats = []
    team.players.each do |player|
      player_stats << PlayerStat.new(:player => player)
    end
    player_stats
  end

  def game_exists(teams)
    exists = false
    Game.all.each do |game|
      existing_game = game.team_stats.map(&:team_id)
      if existing_game.include?(teams[0]) && existing_game.include?(teams.last)
        exists = true
      end
    end
    return exists
  end
end