class Word < ActiveRecord::Base
  has_many :cards
  has_many :games, :through => :cards
  validates_presence_of :word
end
