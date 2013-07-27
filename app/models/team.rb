class Team < ActiveRecord::Base
  attr_accessible :name, :color
  has_many :players
end
