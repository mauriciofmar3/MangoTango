class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.boolean :adjective, :default => false

      t.timestamps
    end
  end
end
