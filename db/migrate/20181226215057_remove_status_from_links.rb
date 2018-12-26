class RemoveStatusFromLinks < ActiveRecord::Migration[5.2]
  def change
    remove_column :links, :status, :integer
  end
end
