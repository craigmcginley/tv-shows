class ChangeCharactersForeignKey < ActiveRecord::Migration
  def change
    rename_column :characters, :tv_show_id, :television_show_id
  end
end
