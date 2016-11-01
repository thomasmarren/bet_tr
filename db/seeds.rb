# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MatchupType.create(name: "Rock, Paper, Scissors")
MatchupType.create(name: "Fashion Show")
MatchupType.create(name: "Wrestling of the Arms")
MatchupType.create(name: "Pie Eating")
MatchupType.create(name: "Cookoff")
MatchupType.create(name: "Staring Contest")
MatchupType.create(name: "Thumb War")

User.create(name: "macdaddy", username: 'macdaddy', password: 'password', balance: 10000000)
User.create(name: "rob", username: 'berto', password: 'password', balance: 10000000)
User.create(name: "tom", username: 'tommy', password: 'password', balance: 10000000)
User.create(name: "eoghan", username: 'eggim', password: 'password', balance: 10000000)
User.create(name: "jake", username: 'zappy', password: 'password', balance: 10000000)

11.times do |user|
  User.create(name: Faker::Name.name, username: Faker::Internet.user_name, password: 'password')
end

# Competitor.create(name: "PAINTRAIN")
# Competitor.create(name: "DEATHOCLOCK")
# Competitor.create(name: "BLOODRIVER")
# Competitor.create(name: "STRONGATHAN")
# Competitor.create(name: "LADYLOVELESS")
# Competitor.create(name: "MISSDISTRESS")
# Competitor.create(name: "WALLOPINGWOMAN")
# Competitor.create(name: "MERCILESSMOTHER")
Competitor.create(name: "Caleb Cox")
Competitor.create(name: "Jess Harrelson")
Competitor.create(name: "Jonathan Peterkin")
Competitor.create(name: "Drew Nickerson")
Competitor.create(name: "Laura Shapiro")
Competitor.create(name: "Nick Scaglione")
Competitor.create(name: "Rebecca Yi")
Competitor.create(name: "Robert Lin")
Competitor.create(name: "Scott Lindquist")
Competitor.create(name: "Tom Marren")
Competitor.create(name: "Colby Pines")
Competitor.create(name: "Amanda Steckler")
Competitor.create(name: "Ben Henriquez")
Competitor.create(name: "Chris Peleti")
Competitor.create(name: "Craig Iturbe")
Competitor.create(name: "Charlie Spencer")
Competitor.create(name: "Zack Adams")
Competitor.create(name: "Eoghan Leddy")
Competitor.create(name: "Marc Immediato")
Competitor.create(name: "Jake Zappin")
Competitor.create(name: "Jason Arnold")
Competitor.create(name: "Jeff Katz")
Competitor.create(name: "James Segarra")
Competitor.create(name: "Jason Gluck")
Competitor.create(name: "Krissa Santos")
Competitor.create(name: "Leigh Scherrer")
Competitor.create(name: "Matt Peleti")
Competitor.create(name: "Kevin Evans")
Competitor.create(name: "Niky Morgan")
Competitor.create(name: "Niti Patel")
Competitor.create(name: "Peregrin Garet")
Competitor.create(name: "SalomÉ Braganza")
Competitor.create(name: "Sam Nagourney")


6.times do |matchup|
  Matchup.create(name: Faker::Hipster.word.capitalize + "palooza", deadline: (DateTime.now + 3.minutes), matchup_type_id: rand(1..7))
end

6.times do |matchup|
  Matchup.create(name: Faker::Hipster.word.capitalize + "palooza", deadline: (DateTime.now + 10.minutes), matchup_type_id: rand(1..7))
end

6.times do |matchup|
  Matchup.create(name: Faker::Hipster.word.capitalize + "palooza", deadline: (DateTime.now + 3.hours), matchup_type_id: rand(1..7))
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

18.times do
  create_matchup_competitor(m_id)
  m_id += 1
end

100.times do
  Bet.create(user_id: rand(1..15), matchups_competitor_id: rand(1..36) , amount: rand(1..5))
end
