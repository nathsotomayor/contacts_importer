class RemoveStatusFromContacts < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :status, :integer
  end
end
