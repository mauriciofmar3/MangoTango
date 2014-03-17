class ChangeUsedToCard < ActiveRecord::Migration
  def change
    remove_column :cards, :used
    add_column :cards, :used, :integer, default: 0
  end
end
