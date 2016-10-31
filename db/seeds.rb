# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MatchupType.create(name: "Rock, Paper, Scissors")
MatchupType.create(name: "Issa Race")
MatchupType.create(name: "Wrestling of the Arms")
MatchupType.create(name: "Pie Eating")

Matchup.create(name: "First MATCH", odds: 2, deadline: DateTime.new(2017, 1, 1), matchup_type_id: 1)
Matchup.create(name: "CriminalFest", odds: 20, deadline: DateTime.new(2016, 12, 16), matchup_type_id: 2)
Matchup.create(name: "Slamotopia", odds: 5, deadline: DateTime.new(2017, 11, 9), matchup_type_id: 3)
Matchup.create(name: "Wallopolooza", odds: 10, deadline: DateTime.new(2018, 5, 9), matchup_type_id: 4)
Matchup.create(name: "Painacopia", odds: 1, deadline: DateTime.new(2016, 11, 16), matchup_type_id: 2)
Matchup.create(name: "BloodBathers", odds: 15, deadline: DateTime.new(2017, 3, 19), matchup_type_id: 3)
Matchup.create(name: "BigBangs", odds: 10, deadline: DateTime.new(2018, 5, 9), matchup_type_id: 1)


User.create(name: 'Mike',username: 'Huckabee',password: 'idiothead')
User.create(name: 'Jimbles',username: 'Nomtrombo',password: 'boijeanius')
User.create(name: 'Timerthy',username: 'TurnerOdd',password: 'sirwishalot')
User.create(name: 'Chuckie',username: 'BabehGing',password: 'lostsouls')
User.create(name: "user", username: 'user', password: 'password')
User.create(name: "macdaddy", username: 'macdaddy', password: 'password')

Competitor.create(name: "PAINTRAIN")
Competitor.create(name: "DEATHOCLOCK")
Competitor.create(name: "BLOODRIVER")
Competitor.create(name: "STRONGATHAN")
Competitor.create(name: "LADYLOVELESS")
Competitor.create(name: "MISSDISTRESS")
Competitor.create(name: "WALLOPINGWOMAN")
Competitor.create(name: "MERCILESSMOTHER")


10.times do |user|
  User.create(name: Faker::Name.name, username: Faker::Internet.user_name, password: 'password')
end

20.times do |competitor|
  Competitor.create(name: Faker::Superhero.name.upcase)
end

10.times do |mt|
  MatchupType.create(name: "Battle of " + Faker::Hipster.word.pluralize.capitalize)
end


20.times do |matchup|
  Matchup.create(name: Faker::Hipster.word.capitalize + "apalooza", deadline: Faker::Date.forward(5), matchup_type_id: rand(1..7))
end

def create_matchup_competitor(matchup_id)
  competitor1_id = rand(1..20)
  MatchupsCompetitor.create(matchup_id:  matchup_id, competitor_id: competitor1_id)
  competitor2_id = rand(1..20)
  until competitor2_id != competitor1_id
    competitor2_id = rand(1..20)
  end
  MatchupsCompetitor.create(matchup_id:  matchup_id, competitor_id: competitor2_id)
end

m_id = 1

20.times do
  create_matchup_competitor(m_id)
  m_id += 1
end

20.times do
  Bet.create(user_id: rand(1..10), matchups_competitors_id: rand(1..20) , amount: rand(1..5))
end
