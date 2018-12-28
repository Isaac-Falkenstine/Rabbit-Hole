class AddStatusToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :status, :integer, :default => 1
  end
end
