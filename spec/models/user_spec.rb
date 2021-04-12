require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#validations" do
  let(:user) { User.new() }

    it 'is missing email' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include ("can't be blank")
    end

    it 'is has an invalid email' do
      user.email = "email"
      expect(user).not_to be_valid
    end

    it 'is missing password' do
      user.password = nil
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include ("can't be blank")
    end

    it 'is missing password confirmation' do
      user.password_confirmation = nil
      expect(user).not_to be_valid
    end

    it 'is has not same password confirmation' do
      user.password = "userpassword123*"
      user.password_confirmation="UserPassword123*"
      expect(user).not_to be_valid
    end

    it 'is has a duplicated email' do
      user2 = User.new
      user2.email = "email@mail.com"
      user.email = "email@mail.com"
      expect(user).not_to be_valid
    end

  end
end