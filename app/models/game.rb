class Game < ActiveRecord::Base
  attr_accessible :week, :schedule_id
  has_many :team_stats, :dependent => :destroy
  belongs_to :schedule

  # def as_json options={}
  #   attrs = [:id ]
  #   team_attrs = [ :score, :result, :team_id ]
  #   super options.merge(:only => attrs, :include => [ :team_stats => { :only => team_attrs } ] )
  # end
end
