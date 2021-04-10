require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validations" do
  let(:user) { User.new() }

    it 'when user missing email' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include ("can't be blank")
    end

    it 'when user has an invalid email' do
      user.email = "email"
      expect(user).not_to be_valid
    end

    it 'when user missing password' do
      user.password = nil
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include ("can't be blank")
    end

    it 'when user missing password confirmation' do
      user.password_confirmation = nil
      expect(user).not_to be_valid
    end

    it 'when user has not same password confirmation' do
      user.password = "userpassword123*"
      user.password_confirmation="UserPassword123*"
      expect(user).not_to be_valid
    end

    it 'when another user has a duplicated email' do
      user2 = User.new
      user2.email = "email@mail.com"
      user.email = "email@mail.com"
      expect(user).not_to be_valid
    end

  end
end