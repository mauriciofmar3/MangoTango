class Card < ActiveRecord::Base
  belongs_to :word
  belongs_to :game
  belongs_to :player
  validates_uniqueness_of :word_id,  :scope => [:game_id, :player_id]
  def word
    @word ||= Word.find(self.word_id).word
  end
  
  def empty?
    return false
  end
  
  def player
    Player.find(self.player_id)
  end
end
