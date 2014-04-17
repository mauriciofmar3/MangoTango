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
    user = User.where(name: cookies[:user]).first
    if Player.where(user_id: user.id, game_id: @game.id).size == 0
      Player.create(user_id: user.id, game_id: @game.id, score: 0)
    end
    @players = @game.players
    @player = Player.where(user_id: User.where(name: cookies[:user]).first.id).first
    @last_winner = @game.last_winner || "-" 
  end

  def leave
    # return to lobby
  end
  
  def lobby
    @games = Game.all
  end
  
  def register
    
  end
  
  def tutorial
    
  end

  def current_adjective
    @game = Game.find(params[:game])
  end
  
  def player_list
    @game = Game.find(params[:game])
    @players = @game.players
  end
  
  def round_information
    @game = Game.find(params[:game])
    @judge = Player.find(@game.current_player_id)
  end
  
  def round_winner
    @game = Game.find(params[:game])
    @chosen_card = Card.where(game_id: @game.id, chosen: @game.current_round-1).first
    unless @chosen_card.empty?
      puts Card.all.pluck(:chosen)
      puts "#{@game.current_adjective.word} #{@game.current_adjective.chosen}"
      @last_winner = @chosen_card.player
      @last_adjective = Word.joins(:cards).where('cards.game_id' => @game.id, 'cards.used' => @game.current_round-1, adjective: true).first
      puts "adjective #{@last_adjective.word}" 
      puts "word #{@chosen_card.word}"
      @last_adjective_word = @last_adjective.word
      @chosen_card_word = @chosen_card.word
    end
  end
  
  def words_used
    @game = Game.find(params[:game])
    @player = Player.find_by(user_id: User.find_by(name: cookies[:user]).id, game_id: @game.id)
  end

  def hand
    game = Game.find(params[:game])
    player = Player.find_by(user_id: User.find_by(name: cookies[:user]).id, game_id: game.id)
    @hand = player.hand
  end
  
  def load_judge
    @game = Game.find(params[:game])
  end
  
  def play_card 
    
    game = Game.find(params[:game])
    player = Player.find_by(user_id: User.find_by(name: cookies[:user]).id, game_id: game.id)
    
    card = Card.find_by(word_id: Word.find_by(word: params[:word]).id, game_id: game.id)
    puts "#{card.word}"
    if card
      game.play_card(card, player)
    end
  end
end