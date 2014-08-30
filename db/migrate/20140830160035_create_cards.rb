class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :uuid
      t.string :type
      t.integer :user_id
      t.timestamps
    end
    
    add_index :cards, :user_id
    add_index :cards, :uuid
  end
end