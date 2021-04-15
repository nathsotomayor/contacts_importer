class ImportedFile < ApplicationRecord
  include AASM
  belongs_to :user

  aasm column: 'state' do
    state :processing, initial: true
    state :waiting
    state :failed
    state :finished

    event :process do
      transitions from: %i[:processing failed], to: :finished
    end

    event :fail do
      transitions from: :processing, to: :failed
    end

    # event :finish do
    #   transitions from :processing, to: :finished
    # end

  end


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
      if contact.save && may_process?
        process!
      else
        fail!(user, contact, contact_hash)
      end

      def fail!(user, contact, contact_hash)
        invalid_contact = InvalidContact.new(name: contact_hash['name'],
                          telephone: contact_hash['telephone'],
                          email: contact_hash['email'], address: contact_hash['address'],
                          birthday: contact_hash['birthday'],
                          credit_card_number: contact_hash['credit_card_number'],
                          credit_card_franchise: contact_hash['credit_card_number'].credit_card_brand_name,
                          credit_card_last_digits: contact_hash['credit_card_number'],
                          user_id: user.id, error: contact.errors.full_messages.join(', '))
        invalid_contact.save
        if may_fail?
          fail!
        end
      end
    end
  end
end
