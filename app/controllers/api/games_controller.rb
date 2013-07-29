class Api::GamesController < ActionController::Base
  respond_to :json

  def index
    @games = Game.where(:schedule_id => params[:schedule_id])
    respond_with json: custom_json_for(@games)
  end

  private
  def custom_json_for(value)
    list = value.map do |game|
      team_stats = []
      game.team_stats.each do |stat|
        team_stats << {:id => stat.id, :team_id => stat.team_id, :team_name => stat.team.name}
      end

      {
        :game => { :id => game.id, :team_stats => team_stats }
      }
    end
    list.to_json
  end
end
