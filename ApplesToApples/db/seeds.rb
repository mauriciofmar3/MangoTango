# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{name: 'mau'}])
User.create([{name: 'merlin'}])
Game.create(name: 'Albion', finished: false, current_round: 1, max_rounds: 20)
Player.create(user_id: 1, game_id: 1, score: 0)
Player.create(user_id: 2, game_id: 1, score: 0)

text=File.open('db/words/nouns').read
text.each_line do |line|
  Word.create(word: line.chomp, adjective: false)
end

text=File.open('db/words/adjectives').read
text.each_line do |line|
  Word.create(word: line.chomp, adjective: true)
end