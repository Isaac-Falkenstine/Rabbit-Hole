class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :links, :url, :link_url
  end
end
