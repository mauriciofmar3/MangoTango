class UserController < ApplicationController
  def register
    user = User.new
    user.name = params[:name]
    result = game.save
    if result
      redirect_to :action => 'game#index'
    else
      redirect_to :action => 'user#index'
    end
  end
  
  def login
    if User.where(name: params[:name]).count > 0
      cookies[:user] = params[:name] 
      redirect_to :controller => 'game', :action => 'index'
    else
      redirect_to :controller => 'game', :action => 'login'
    end
  end
  
  def index
    @game = params[:game]
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @game = params[:game]
    @game.destroy
  end

  def join
    @game = Game.find(params[:game])
    @players = @game.players
    @player = Player.where(user_id: cookies[:user])
  end

  def leave
    # return to lobby
  end
end
