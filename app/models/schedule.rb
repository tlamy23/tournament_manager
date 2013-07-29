class Schedule < ActiveRecord::Base
  attr_accessible :date, :description
  has_many :games
end
