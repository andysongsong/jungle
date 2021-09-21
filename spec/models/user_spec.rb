require 'rails_helper'

RSpec.describe User, type: :model do

  context 'password match' do
    user = User.new(email: 'test@test.com', password: 'andy', password_confirmation: 'andy')
    user.valid?
    it 'password match' do
      expect(user.errors[:password_confirmation]).not_to be_present
    end
  end

  context "password don't match" do
    user = User.new(email: 'test@test.com', password: 'andy', password_confirmation: 'aaa')
    user.valid?
    it "password don't match" do
      expect(user.errors[:password_confirmation]).to be_present
    end
  end

  it 'email must be unique' do
    user = User.new(email: 'test@test.com', password: 'andy', password_confirmation: 'andy')
    user.save

    u = User.new(email: 'test@test.com', password: 'andy', password_confirmation: 'andy')
    u.save

    expect(u.errors[:email].first).to eq('has already been taken')
  end

  it 'password length less than 5 characters is invalid' do
    user = User.new(email: 'emy', password: '2222')

    result = user.save

    expect(result).to be(false)
  end

  it 'password length must be at-least 5 characters' do
    user = User.new(email: 'alen', password: '33333')

    result = user.save

    expect(result).to be(true)
  end
end
