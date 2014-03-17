class Game < ActiveRecord::Base
  has_many :players
  has_many :words
  has_many :cards
  has_many :users, :through => :players
  has_many :words, :through => :cards

  def players
    @players ||= Player.where(game_id: self)
  end
  
  def used_cards
    @used_cards ||= Card.where(game_id: self, used: true)
  end
  
  def last_winner
    cards = Card.order(updated_at: :desc).where(game_id: self, chosen: true).limit(1)
    return false if cards.empty?
    Player.find(cards.first.player_id)
  end
  
  def current_adjective
    card = Card.joins(:word).where(words: {adjective: true}, cards: {game_id: self, used: 0}).limit(1).first
    while !card || card.empty?
      word = Word.where(adjective: true).order("rand()").limit(1).first
      card = Card.create(word_id: word.id, game_id: self.id) if word && Card.where(word_id: word.id).empty?
    end
    card
  end
end