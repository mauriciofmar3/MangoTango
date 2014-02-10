class Game < ActiveRecord::Base
  has_many :players
  has_many :words
  has_many :cards
  has_many :users, :through => :players
  has_many :words, :through => :cards
end
