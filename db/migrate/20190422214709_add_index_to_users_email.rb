class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    # This enforces uniqueness on a DB level. Without this, if a user presses "create account" twice, their email
    # might end up in the DB twice bc of ms delay between creating account and saving the record.
    # It also makes searching by email more efficient.
    add_index :users, :email, unique: true
  end
end
