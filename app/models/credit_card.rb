class CreditCard < ApplicationRecord
  def initialize(credit_card_num)
    @credit_card = credit_card_num
  end

  def last_four_digits
    @credit_card.last(4).to_s
  end

  def encryption
    BCrypt::Password.create(@credit_card)
  end
end
