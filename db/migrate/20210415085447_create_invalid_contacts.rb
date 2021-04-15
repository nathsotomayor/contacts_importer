class CreateInvalidContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :invalid_contacts do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :address
      t.string :birthday
      t.string :credit_card_number
      t.string :credit_card_franchise
      t.string :credit_card_last_digits
      t.string :error
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
