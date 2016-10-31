require 'rails_helper'

RSpec.describe Bet, type: :model do
  before do
    @user_1 = User.create(name: "Bob", username: "bobsburgers", password: "password")
    @user_2 = User.create(name: "John", username: "johnnyboy", password: "password")
    @matchup_type = MatchupType.create(name: "Rock Paper Scissors")
    @matchup_1 = Matchup.create(name: "PAIN IN THE RAIN", odds: 1.0, deadline: Time.now, matchup_type_id: 1)
    @matchup_2 = Matchup.create(name: "DEATH STAR", odds: 2.0, deadline: Time.now, matchup_type_id: 1)
    @competitor_1 = Competitor.create(name: "Bill Gates")
    @competitor_2 = Competitor.create(name: "Steve Ballmer")
    @competitor_3 = Competitor.create(name: "Darth Vader")
    @competitor_4 = Competitor.create(name: "Luke Skywalker")
    @mc1 = MatchupsCompetitor.create(matchup_id: 1, competitor_id: 1, winner: true)
    @mc2 = MatchupsCompetitor.create(matchup_id: 1, competitor_id: 2, winner: false)
    @mc3 = MatchupsCompetitor.create(matchup_id: 1, competitor_id: 3, winner: false)
    @mc4 = MatchupsCompetitor.create(matchup_id: 1, competitor_id: 4, winner: true)
  end

  let(:first_bet) {Bet.create(user_id: 1, matchups_competitor_id: 1, amount: 20)}
  let(:second_bet) {Bet.create(user_id: 1, matchups_competitor_id: 3, amount: 20)}

  it "is valid with a user_id and a matchups_competitor_id" do
     
    expect(first_bet).to be_valid
    expect(second_bet).to be_valid
  end

  # it "cannot bet more than your balance" do
  #   large_bet = Bet.create(user_id: 1, matchups_competitor_id: 2, amount: 1000)
  #   # expect an error??
  #   expect
  # end

  it "defaults status => 'Open'" do
     
    expect(first_bet.status).to eq("Open")
    expect(first_bet.status).to eq("Open")
  end

  describe '#payout_amount' do
    it 'payout calculation based on odds' do
       
      expect(first_bet.payout_amount).to eq(20)
      expect(second_bet.payout_amount).to eq(40)
    end
  end

  describe '#resolve' do
    it 'pays out properly and closes the bet' do
      first_bet.resolve
      second_bet.resolve
      expect(@user_1.balance).to eq(120)
      expect(first_bet.status).to eq("Closed")
      expect(second_bet.status).to eq("Closed")
    end

    it 'pays out property and closes the bet' do
      new_bet = Bet.create(user_id: 2, matchups_competitor_id:4, amount: 10)
      expect(@user_2.balance).to eq(90)
      expect(new_bet.status).to eq("Open")
      expect(new_bet.payout_amount).to eq(20)
      new_bet.resolve
      expect(@user_2.balance).to eq(120)
      expect(new_bet.status).to eq("Closed")
    end
  end

end
