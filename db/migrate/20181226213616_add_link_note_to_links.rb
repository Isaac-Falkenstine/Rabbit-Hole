class AddLinkNoteToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :link_note, :string, :limit => 255
  end
end
