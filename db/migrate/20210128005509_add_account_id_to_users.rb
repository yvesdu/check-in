class AddAccountIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :account, type: :uuid, foreign_key: true, index: true
    # make sure it uses uuid, is indexed and is a foreign key
  end
end