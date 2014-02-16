class Game < ActiveRecord::Base
  has_many :players
  has_many :words
  has_many :cards
  has_many :users, :through => :players
  has_many :words, :through => :cards

  def players
    @players ||= Player.where(game_id: self)
  end
end