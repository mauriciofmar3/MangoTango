class CardController < ApplicationController
  def hand
    @user = User.where(name: params[:user])
    
  end
end
