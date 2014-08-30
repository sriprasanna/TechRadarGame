class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :won_by
      t.integer :lost_by
      t.integer :card

      t.timestamps
    end
    
    add_index :histories, :won_by
    add_index :histories, :lost_by
    add_index :histories, :card
  end
end