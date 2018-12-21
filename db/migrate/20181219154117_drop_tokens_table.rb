class DropTokensTable < ActiveRecord::Migration[5.2]

  def change
    drop_table :tokens do |t|
      t.references :user, foreign_key: true
      t.string :token
      t.string :token_name

      t.timestamps
    end
  end

end
