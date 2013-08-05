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
  end
end
