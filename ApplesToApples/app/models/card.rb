class Card < ActiveRecord::Base
  belongs_to :words
  belongs_to :games
  belongs_to :players
end
