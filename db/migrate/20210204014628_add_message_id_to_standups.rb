class AddMessageIdToStandups < ActiveRecord::Migration[6.0]
  def change
    add_column :standups, :message_id, :string
    add_index :standups, :message_id
  end
end
