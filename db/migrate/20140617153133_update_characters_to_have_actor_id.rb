class UpdateCharactersToHaveActorId < ActiveRecord::Migration
  def change
    remove_column :characters, :actor_name
    add_column :characters, :actor_id, :integer, null: false
  end
end
