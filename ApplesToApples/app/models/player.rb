class Player < ActiveRecord::Base
  belongs_to :games
  has_many :cards
  has_many :words, :through => :cards
end
