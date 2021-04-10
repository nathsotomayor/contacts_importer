require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validations" do
  #let(:user) {User.new()}

    it 'user missing email' do
      user = User.new
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include ("can't be blank")
    end

  end
end