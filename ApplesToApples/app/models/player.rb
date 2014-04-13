class Player < ActiveRecord::Base
  belongs_to :games
  has_many :cards
  has_many :words, :through => :cards
  validates :score, presence: true, numericality: {greater_than_or_equal_to: 0}

  def user
    @user ||= User.find(self.user_id)
  end

  def hand
    cards = Card.where(player_id: self.id, game_id: self.game_id, used: false)
    while cards.size < 7 do
      word = Word.find(rand(Word.count))
      if Card.where(word_id: word.id, game_id: self.game_id).size == 0
        cards << Card.create(game_id: self.game_id, player_id: self.id, word_id: word.id, used: 0)
      end
    end
    cards
  end
  
  def used_cards
    @used_cards ||= Card.where(player_id: self, used: true, game_id: self.game_id)
  end
end