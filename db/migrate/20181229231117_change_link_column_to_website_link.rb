class ChangeLinkColumnToWebsiteLink < ActiveRecord::Migration[5.2]
  def change
    rename_column :links, :saved_link_url, :website_link_text
  end
end
