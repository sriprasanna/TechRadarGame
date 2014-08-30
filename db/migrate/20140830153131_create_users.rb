class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :image
      t.string :url
      t.integer :cards_count, default: 0
      t.timestamps
    end
    
    add_index :users, [:provider, :uid], :unique => true
  end
end