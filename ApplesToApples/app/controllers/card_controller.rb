class CardController < ApplicationController
  def hand
    @user = User.where(name: params[:user])
    
  end
  
  def delete_all
    Card.all.each do |card|
      card.destroy      
    end
  end
end
