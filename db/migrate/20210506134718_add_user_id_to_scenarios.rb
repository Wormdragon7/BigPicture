class AddUserIdToScenarios < ActiveRecord::Migration[6.1]
  def change
    add_reference :scenarios, :user, foreign_key: true
  end
end
