class AddAtributeOnlineToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :online, :boolean, default: true
  end
end
