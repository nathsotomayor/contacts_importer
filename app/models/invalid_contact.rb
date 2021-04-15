class InvalidContact < ApplicationRecord
  belongs_to :user

  validates :error, presence: true

  validate :setting_last_digits

  def setting_last_digits
    self.credit_card_last_digits = CreditCard.new(credit_card_last_digits).last_four_digits
  end
end
