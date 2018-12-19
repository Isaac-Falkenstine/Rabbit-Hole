class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :goal
      t.boolean :complete

      t.timestamps
    end
  end
end
