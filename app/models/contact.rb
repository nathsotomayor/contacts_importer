class Contact < ApplicationRecord
  validates :name, :email, :address, :birthday, :credit_card_number, :credit_card_franchise, presence: true
  validates :telephone, presence: true,
            format: { with: /\A(\(\+\d{2}\)[\s]\d{3}[\s]\d{3}[\s]\d{2}[\s]\d{2})|(\(\+\d{2}\)[\s]\d{3}[-]\d{3}[-]\d{2}[-]\d{2})\z/,
            message: "(+00) 000 000 00 00 and (+00) 000-000-00-00 are the only telephone formats permitted" }


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      contact_hash = row.to_hash
      contact = find_or_create_by!(name: contact_hash['name'], telephone: contact_hash['telephone'],
                                  email: contact_hash['email'], address: contact_hash['address'],
                                  birthday: contact_hash['birthday'],
                                  credit_card_number: contact_hash['credit_card_number'],
                                  credit_card_franchise: contact_hash['credit_card_franchise'])
      contact.update(contact_hash)
    end
  end

end
