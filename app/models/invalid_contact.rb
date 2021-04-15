class InvalidContact < ApplicationRecord
  belongs_to :user

  validates :error, presence: true

  validate :detect_franchise
  validate :setting_last_digits
  after_validation :credit_card_encryption

  def setting_last_digits
    self.credit_card_last_digits = CreditCard.new(credit_card_last_digits).last_four_digits
  end

  def detect_franchise
    CreditCard.new(credit_card_number)
    self.credit_card_franchise = CreditCardValidations::Detector.new(credit_card_number).brand_name
  end

  def credit_card_encryption
    self.credit_card_number = CreditCard.new(credit_card_number).encryption
  end
end
