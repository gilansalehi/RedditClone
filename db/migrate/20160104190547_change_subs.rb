class ChangeSubs < ActiveRecord::Migration
  def change
    remove_index :subs, :mod_id
    add_index :subs, :mod_id
  end
end
