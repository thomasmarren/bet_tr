require 'rails_helper'

RSpec.describe Matchup, type: :model do

  let (:matchup_type) { MatchupType.create(name: "Jedi Powers Royal Rumble") }
  let(:matchup) { Matchup.create(name: "DeathLine", deadline: Time.zone.tomorrow,
     odds: 5.0, matchup_type_id: matchup_type.id) }


  describe '#deadline' do
    it 'is a valid Date object' do
      expect(matchup.deadline).to be_a(ActiveSupport::TimeWithZone)
    end
  end

  describe '#matchup_type_id' do
    it 'points to a valid matchup type object' do
       
      expect(MatchupType.find(matchup.matchup_type_id)).to be_a(MatchupType)
    end
  end

  describe '#get_num_matchups_for_chart' do
    it 'returns a properly coerced Hash data structure' do
      expect(matchup.get_num_matchups_for_chart).to be_a(Hash)
    end
  end

end
