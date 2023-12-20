class AddCustomerToGlobalReward < ActiveRecord::Migration[7.0]
  def change
    add_reference :global_rewards, :customer, foreign_key: true
  end
end
