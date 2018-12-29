class AddTopicNotesToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :topic_notes, :string
  end
end
