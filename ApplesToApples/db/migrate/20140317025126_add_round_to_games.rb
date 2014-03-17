class AddRoundToGames < ActiveRecord::Migration
  def change
    add_column :games, :max_rounds, :integer
    add_column :games, :current_round, :integer, :default => 0
    add_column :games, :current_player_id, :integer
    remove_column :games, :current_count
  end
end
