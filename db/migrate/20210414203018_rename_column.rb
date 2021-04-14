class RenameColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :contacts, :error, :credit_card_last_digits
  end
end
