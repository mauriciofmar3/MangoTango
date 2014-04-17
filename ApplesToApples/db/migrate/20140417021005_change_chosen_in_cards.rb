class ChangeChosenInCards < ActiveRecord::Migration
  def change
    remove_column :cards, :chosen
    add_column :cards, :chosen, :integer, default: 0
  end
end
