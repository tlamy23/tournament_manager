class Player < ActiveRecord::Base
  attr_accessible :first_name, :height, :last_name, :nickname, :weight
end
