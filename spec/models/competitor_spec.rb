require 'rails_helper'

RSpec.describe Competitor, type: :model do

  let(:competitor1) {Competitor.create(name: "Batman")}
  let(:competitor2) {Competitor.create(name: "Superman")}

  let(:user) {User.create(name: "user1", username: "user", password: "password")}

  let(:matchup) {Matchup.create(name: "Battle1")}

  let(:matchups_competitor1) {MatchupsCompetitor.create(matchup_id: matchup.id, competitor_id: competitor1.id)}
  let(:matchups_competitor2) {MatchupsCompetitor.create(matchup_id: matchup.id, competitor_id: competitor2.id)}

  let(:bet) {Bet.create(user_id: user.id, matchups_competitor: matchups_competitor1.id, amount: 50)}

  describe '#name' do
    it 'getter method returns a Competitor in all caps' do
      expect(competitor1.name).to eq("BATMAN")
    end
  end

  # Matchup.create(name: "Battle1")
  # describe '#users' do
  #   it 'returns all users who bet on competitor' do
  #     expect(competitor1.users).to include(user)
  #   end
  # end

end
