class AddChosenToCards < ActiveRecord::Migration
  def change
    add_column :cards, :chosen, :boolean
  end
end
