class AddUserToOpportunities < ActiveRecord::Migration[6.0]
  def change
    add_reference :opportunities, :user, null: false, foreign_key: true
  end
end
