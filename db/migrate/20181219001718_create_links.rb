class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :question, foreign_key: true
      t.string :name
      t.string :url
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
