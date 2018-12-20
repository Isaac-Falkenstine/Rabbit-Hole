class CreateGoogleOauthTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :google_oauth_tokens do |t|
      t.string :token
      t.string :refresh_token
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
