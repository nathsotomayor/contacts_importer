class Contact < ApplicationRecord
  belongs_to :user

  validates :name, :email, :address, :birthday, :credit_card_number, :credit_card_franchise, presence: true

  validates :name, format: { with: /\A[a-zA-Z\s-]+\z/, message: 'cannot have special characters, you can use only "-" ' }

  validates :email,
            uniqueness: {
              scope: :user_id,
              message: "you can't have two contacts with the same email"
            },
            format: {
              with: /\A[^@\s]+@[^@\s]+\z/,
              message: "Must be a valid email address"
            }

  validates :telephone, presence: true,
            format: { with: /\A(\(\+\d{2}\)[\s]\d{3}[\s]\d{3}[\s]\d{2}[\s]\d{2})|(\(\+\d{2}\)[\s]\d{3}[-]\d{3}[-]\d{2}[-]\d{2})\z/,
            message: "(+00) 000 000 00 00 and (+00) 000-000-00-00 are the only telephone formats permitted" }

  #validates :credit_card_number, credit_card_number: true

  validate :birthday_format

  validate :setting_last_digits

  after_validation :credit_card_encryption

  def birthday_format
    Date.iso8601(birthday)
  rescue StandardError
    errors.add(:birthday, 'only formats YYYYMMDD and YYYY-MM-DD are allowed')
  end

  def setting_last_digits
    self.credit_card_last_digits = CreditCard.new(credit_card_last_digits).last_four_digits
  end

  def credit_card_encryption
    self.credit_card_number = CreditCard.new(credit_card_number).encryption
  end

end
