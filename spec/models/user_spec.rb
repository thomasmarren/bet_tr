require "rails_helper"


RSpec.describe User, type: :model do
  it "is valid" do
    user = User.new(name: "bob", username: "joebob", password: "password")
    expect(user).to be_valid
  end

  it "is valid with a name, username and password" do
    user = User.new(name: "jake", username: "jakethesnake", password: "password")
    expect(user).to be_valid
  end

  it "has a balance of 100 on initialization" do
    user = User.new(name: "sally", username: "sally1", password: "password")
    expect(user.balance).to eq(100)
  end

  it "is invalid with no name" do
    user = User.new(username: "billybob", password: "password")
    expect(user).to be_invalid
  end

  it "is invalid with no username" do
    user = User.new(name: "tom", password: "password")
    expect(user).to be_invalid
  end

  it "is invalid with no username" do
    user = User.new(name: "tom", username: "tomcat")
    expect(user).to be_invalid
  end

  it "is invalid when username non-unique" do
    User.create(name: "jake", username: "awesomedude", password: "password")
    user = User.new(name: "berto", username: "awesomedude", password: "password")
    expect(user).to be_invalid
  end

  describe 'authenticate' do
    it 'returns the user if credentials match' do
      user = User.new(name: "larry", username: "lars", password: "password")
      expect(user.authenticate('password')).to eq(user)
    end

    it "returns falsey if credentials don't match" do
      user = User.new(name: "bruce", username: "batman", password: "password")
      expect(user.authenticate('passw0rd')).to be_falsey
    end
  end

end
