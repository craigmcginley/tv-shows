class AddCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character_name, null: false
      t.string :actor_name, null: false
      t.string :description
      t.integer :tv_show_id, null:false
    end
  end
end
