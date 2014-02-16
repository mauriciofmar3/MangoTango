class Player < ActiveRecord::Base
  belongs_to :games
  has_many :cards
  has_many :words, :through => :cards
  validates :score, presence: true, numericality: {greater_than_or_equal_to: 0}

  def user
    @user ||= User.find(self.user_id)
  end
end