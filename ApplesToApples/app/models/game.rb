class Game < ActiveRecord::Base
  has_many :players
  has_many :words
  has_many :cards
  has_many :users, :through => :players
  has_many :words, :through => :cards

  def players
    Player.where(game_id: self)
  end
  
  def used_cards
    Card.where(game_id: self, used: self.current_round)
  end
  
  def last_winner
    cards = Card.order(updated_at: :desc).where(game_id: self, chosen: true).limit(1)
    return false if cards.empty?
    Player.find(cards.first.player_id)
  end
  
  def current_adjective
    card = Card.joins(:word).where(words: {adjective: true}, cards: {game_id: self, used: 0}).limit(1).first
    while !card || card.empty?
      word = Word.where(adjective: true).order("rand()").limit(1).first
      card = Card.create(word_id: word.id, game_id: self.id) if word && Card.where(word_id: word.id).empty?
    end
    Card.find(card.id)
  end
  
  def current_player
    Player.find(self.current_player_id)
  end
  
  def play_card(card, player)
    puts "card was used? #{card.used}"
    if card.used != 0
      play_judge_card(card, player)
    else
      play_normal_card(card, player)
    end
  end
  
  private
 
  def play_normal_card(card, player)
    # game has to have started
    # player can't be current judge, else send to play_judge_card
    # player can't have already played a card
    
    game_started = self.max_players == self.players.size
    player_not_judge = self.current_player_id != player.id
    player_not_played = Card.where(game_id: self.id, player_id: player.id, used: self.current_round).empty?
    player_owns_card = player.id == card.player.id
    game_not_finished = !self.finished
    puts "#{game_started} #{player_not_judge} #{player_not_played} #{player_owns_card} #{game_not_finished}"
    if game_started and player_not_judge and player_not_played and player_owns_card and game_not_finished
      card = Card.find(card.id)
      card.used=self.current_round
      card.chosen=0
      card.save
    end
  end
  
  def play_judge_card(card, player)
    # game has to have started
    # player has to be current judge
    # player can't have already judged a card
    # all players played
    # game updates: 
    # => current_round
    # => current_player
    # => finished
    # => change adjective
    # card updates: 
    # => old used cards
    # => chosen
    # => used
    # player updates: 
    # => score++ to winner
    game_started = self.max_players == self.players.size
    player_is_judge = self.current_player_id == player.id
    player_not_played = Card.where(game_id: self.id, player_id: player.id, chosen: self.current_round).empty?
    all_players_played = Card.where(game_id: self.id, used: self.current_round).size == (self.max_players-1)
    game_not_finished = !self.finished
    puts "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    puts "judge game_started player_is_judge player_not_played all_players_played"
    puts "judge #{game_started} #{player_is_judge} #{player_not_played} #{all_players_played} #{game_not_finished}"
    if game_started and player_is_judge and player_not_played and all_players_played and game_not_finished
      # card updates
      adjective = self.current_adjective
      adjective.used = self.current_round
      card.chosen = self.current_round
      
      #game updates
      self.finished = true if self.max_rounds == self.current_round
      self.current_round = self.current_round + 1
      self.current_player_id = self.players.sort.rotate(self.players.find_index(self.current_player)+1).first.id
      
      #player updates
      winner = card.player
      winner.score = winner.score + 1
      
      adjective.save
      self.save
      winner.save
      card.save
    end
  end
end