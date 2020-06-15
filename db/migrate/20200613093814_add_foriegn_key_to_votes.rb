class AddForiegnKeyToVotes < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :votes, :users, column: 'UserId'
  end
end
