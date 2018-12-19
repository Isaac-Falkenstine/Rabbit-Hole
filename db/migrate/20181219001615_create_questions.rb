class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :topic, foreign_key: true
      t.string :title
      t.text :notes_text

      t.timestamps
    end
  end
end
