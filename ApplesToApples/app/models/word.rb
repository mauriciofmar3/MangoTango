class Word < ActiveRecord::Base
  has_many :cards
  has_many :games, :through => :cards
end
