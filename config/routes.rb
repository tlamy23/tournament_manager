TournamentManager::Application.routes.draw do
  devise_for :users

  resources :schedules


  resources :players

  resources :games, :except => [:new, :create]
  resources :teams

  get 'standings' => 'dashboard#standings'
  get 'generate_tournament' => 'actions_helper#generate_games'

  root :to => 'dashboard#standings'

  namespace :api do
    resources :schedules, :only => :index
    resources :games, :only => [:index, :show]
  end

end
