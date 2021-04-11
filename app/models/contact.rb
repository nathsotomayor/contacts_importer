class Contact < ApplicationRecord
  validates :name, presence: true
  validates :telephone, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :birthday, presence: true
  validates :credit_card_number, presence: true
  validates :credit_card_franchise, presence: true

end
