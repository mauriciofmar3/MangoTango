class GameController < ApplicationController
  def create
    game = Games.new
    game.name = params[:name]
    game.save
    redirect_to :action => 'game#join'
  end
  
  def login
    if(User.where(name: params[:name]).count > 0)
      cookies[:user] = params[:name]
      redirect_to controller: 'game', action: 'join', game: '1'
    else
      redirect_to :controller => 'game', :action => 'index'
    end
  end

  def index
    @games = Game.all
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
    @player = Player.where(user_id: User.where(name: cookies[:user]).first.id).first
    @last_winner = @game.last_winner || "-" 
  end

  def leave
    # return to lobby
  end

  def hand
    game = Game.find(params[:game])
    player = Player.find_by(user_id: User.find_by(name: cookies[:user]).id, game_id: game.id)
    @hand = player.hand
  end
  
  def play_card
    game = Game.find(params[:game])
    player = Player.find_by(user_id: User.find_by(name: cookies[:user]).id, game_id: game.id)
    
    card = Card.find_by(word_id: Word.find_by(word: params[:word]).id, game_id: game.id, player_id: player.id)
    if card
      card.used=game.current_round
      card.save
    end
  end
end