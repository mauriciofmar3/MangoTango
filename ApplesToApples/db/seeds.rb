# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{name: 'mau'}])
User.create([{name: 'merlin'}])
User.create([{name: 'meghan'}])
User.create([{name: 'roxy'}])
Game.create(name: 'Albion', finished: false, current_round: 1, max_rounds: 20, max_players: 3, current_player_id: 1)
Player.create(user_id: 1, game_id: 1, score: 0)
Player.create(user_id: 2, game_id: 1, score: 0)
Player.create(user_id: 3, game_id: 1, score: 0)
#Player.create(user_id: 4, game_id: 1, score: 0)

def seed_file(file, adjective)
  text=File.open(file).read
  text.each_line do |line|
    if Word.where(word: line.chomp).empty?
      Word.create(word: line.chomp, adjective: adjective)
    end
  end
end

#seed_file('db/words/adjectives', true)
#seed_file('db/words/nouns', false)

seed_file('db/words/nutsy_adjectives', true)
seed_file('db/words/nutsy_nouns', false)
  