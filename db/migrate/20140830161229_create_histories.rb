class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :won_by_id
      t.integer :lost_by_id
      t.integer :card_id

      t.timestamps
    end
    
    add_index :histories, :won_by_id
    add_index :histories, :lost_by_id
    add_index :histories, :card_id
  end
end