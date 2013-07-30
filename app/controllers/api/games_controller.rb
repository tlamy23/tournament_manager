class Api::GamesController < ActionController::Base
  respond_to :json

  def index
    @games = Game.where(:schedule_id => params[:schedule_id])
    respond_with json: index_custom_json(@games)
  end

  def show
    @game = Game.find(params[:id])
    respond_with json: game_custom_json(@game)
  end


  private
  def index_custom_json(value)
    list = value.map do |game|
      team_stats = []
      game.team_stats.each do |stat|
        team_stats << {:id => stat.id, :team_id => stat.team_id, :team_name => stat.team.name}
      end

      {
        :game => { :id => game.id, :team_stats => team_stats }
      }
    end
    list
  end

  def game_custom_json(game)
    team_stats = []
    game.team_stats.map do |team_stat|
      player_stats = []
      team_stat.player_stats.each do |player_stat|
        player_stats << {:id => player_stat.id, :player_name => player_stat.player.first_name, :points => player_stat.points, :fouls => player_stat.fouls}
      end
      team_stats << {:id => team_stat.id, :team => team_stat.team.name, :score => team_stat.score, :result => team_stat.result, :player_stats => player_stats}
    end
    list = {:game => { :id => game.id, :team_stats => team_stats }}
    puts "#{list.class}"
    list
  end
end
