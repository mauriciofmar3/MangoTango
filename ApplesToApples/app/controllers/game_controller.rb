class GameController < ApplicationController
  def create
    game = Games.new
    game.save
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
    # send to
    @game = Game.find(params[:game])
    @players = @game.players

  end

  def leave
    # return to lobby
  end
end