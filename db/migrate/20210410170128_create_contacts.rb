class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name,                   null: false, default: ""
      t.string :telephone,              null: false, default: ""
      t.string :email,                  null: false, default: ""
      t.string :address,                null: false, default: ""
      t.date :birthday,                 null: false, default: ""
      t.string :credit_card_number,     null: false, default: ""
      t.string :credit_card_franchise,  null: false, default: ""
      t.integer :status,                default: ""
      t.string :error,                  default: ""


      t.timestamps
    end

    add_index :contacts, :email,                unique: true

  end
end
