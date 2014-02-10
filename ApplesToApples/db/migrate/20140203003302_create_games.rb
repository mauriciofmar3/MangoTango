class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :current_count
      t.boolean :finished

      t.timestamps
    end
  end
end
