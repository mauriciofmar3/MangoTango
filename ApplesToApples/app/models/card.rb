class Card < ActiveRecord::Base
  belongs_to :word
  belongs_to :game
  belongs_to :player
  def word
    @word ||= Word.find(self.word_id).word
  end
  
  def empty?
    return false
  end
end
