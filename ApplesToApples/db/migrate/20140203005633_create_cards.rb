class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :game
      t.belongs_to :word
      t.belongs_to :player
      t.boolean :used

      t.timestamps
    end
  end
end
