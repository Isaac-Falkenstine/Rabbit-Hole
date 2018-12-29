class ChangeLinkColumnToSavedLinkUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :links, :link_url, :saved_link_url
  end
end
