class RenameColumnStatus < ActiveRecord::Migration[6.1]
  def change
    rename_column :imported_files, :status, :state
  end
end
