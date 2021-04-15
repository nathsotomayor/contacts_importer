class ImportedFile < ApplicationRecord
  belongs_to :user

  def import(file, user)
    CSV.foreach(file.path, headers: true) do |row|
      contact_hash = row.to_hash
      contact = Contact.new(name: contact_hash['name'], telephone: contact_hash['telephone'],
                email: contact_hash['email'], address: contact_hash['address'],
                birthday: contact_hash['birthday'],
                credit_card_number: contact_hash['credit_card_number'],
                credit_card_franchise: contact_hash['credit_card_number'].credit_card_brand_name,
                credit_card_last_digits: contact_hash['credit_card_number'],
                user_id: user.id)
      contact.save
      if contact.save
        done
      else
        invalid_contact = InvalidContact.new(name: contact_hash['name'],
                          telephone: contact_hash['telephone'],
                          email: contact_hash['email'], address: contact_hash['address'],
                          birthday: contact_hash['birthday'],
                          credit_card_number: contact_hash['credit_card_number'],
                          credit_card_franchise: contact_hash['credit_card_number'].credit_card_brand_name,
                          credit_card_last_digits: contact_hash['credit_card_number'],
                          user_id: user.id, error: contact.errors.full_messages.join(', '))
        invalid_contact.save
      end
    end
  end
end
