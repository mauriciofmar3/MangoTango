class Player < ActiveRecord::Base
  belongs_to :games
  has_many :cards
  has_many :words, :through => :cards
  validates :score, presence: true, numericality: {greater_than_or_equal_to: 0}

  def user
    @user ||= User.find(self.user_id)
  end
  
  def name
    self.user.name
  end

  def hand
    cards = Card.where(player_id: self.id, game_id: self.game_id, used: false)
    game_words = Word.joins(:cards).where('cards.game_id' => self.game_id).pluck(:word)
    game_words = 'a' if game_words.empty?
    new_words = Word.where("adjective=false and word NOT IN (?)", game_words).order("rand()").limit(7-cards.size)
    new_words.each do |word|
      cards << Card.create(game_id: self.game_id, player_id: self.id, word_id: word.id, used: 0, chosen: 0)  
    end
    cards.uniq
  end
  
  def used_cards
    @used_cards ||= Card.where(player_id: self, used: true, game_id: self.game_id)
  end
end


