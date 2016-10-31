require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.create(name: "Bob", username: "bobsburgers", password: "password")}

  describe '#balance' do
    it 'initializes with balance of 100' do
      expect(user.balance).to eq(100)
    end
  end

end
