class CreateGlobalRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :global_rewards do |t|
      t.integer :reward_points_remaining

      t.timestamps
    end
  end
end
