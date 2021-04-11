require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe '#validations' do
    let(:contact) { Contact.new() }

    it "is valid with a firstname, lastname and email" do
      contact = Contact.new(
        name: 'Joseph',
        telephone: '3119087632',
        email: 'tester@example.com',
        address: 'Calle 4 63-45',
        birthday: '1962 Julio 15',
        credit_card_number: '4111111111111111',
        credit_card_franchise: 'Visa')
      expect(contact).to be_valid
    end

    it 'is missing name' do
      contact.name = nil
      expect(contact).not_to be_valid
      expect(contact.errors[:name]).to include ("can't be blank")
    end

    it 'is missing telephone' do
      contact.telephone = nil
      expect(contact).not_to be_valid
      expect(contact.errors[:telephone]).to include ("can't be blank")
    end

    it 'is missing email' do
      contact.email = nil
      expect(contact).not_to be_valid
      expect(contact.errors[:email]).to include ("can't be blank")
    end

    it 'is missing address' do
      contact.address = nil
      expect(contact).not_to be_valid
      expect(contact.errors[:address]).to include ("can't be blank")
    end

    it 'is missing birthday' do
      contact.birthday = nil
      expect(contact).not_to be_valid
      expect(contact.errors[:birthday]).to include ("can't be blank")
    end

    it 'is missing credit card number' do
      contact.credit_card_number = nil
      expect(contact).not_to be_valid
      expect(contact.errors[:credit_card_number]).to include ("can't be blank")
    end

    it 'is missing credit card franchise' do
      contact.credit_card_franchise = nil
      expect(contact).not_to be_valid
      expect(contact.errors[:credit_card_franchise]).to include ("can't be blank")
    end

  end
end
