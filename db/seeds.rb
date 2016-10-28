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

Competitor.create(name: "PAINTRAIN")
Competitor.create(name: "DEATHOCLOCK")
Competitor.create(name: "BLOODRIVER")
Competitor.create(name: "STRONGATHAN")
Competitor.create(name: "LADYLOVELESS")
Competitor.create(name: "MISSDISTRESS")
Competitor.create(name: "WALLOPINGWOMAN")
Competitor.create(name: "MERCILESSMOTHER")

MatchupsCompetitor.create(matchup_id:  1, competitor_id: 1)
MatchupsCompetitor.create(matchup_id:  1, competitor_id: 2)
MatchupsCompetitor.create(matchup_id:  2, competitor_id: 2)
MatchupsCompetitor.create(matchup_id:  2, competitor_id: 3)
MatchupsCompetitor.create(matchup_id:  3, competitor_id: 3)
MatchupsCompetitor.create(matchup_id:  3, competitor_id: 4)
MatchupsCompetitor.create(matchup_id:  4, competitor_id: 4)
MatchupsCompetitor.create(matchup_id:  4, competitor_id: 5)
MatchupsCompetitor.create(matchup_id:  5, competitor_id: 5)
MatchupsCompetitor.create(matchup_id:  5, competitor_id: 6)
MatchupsCompetitor.create(matchup_id:  6, competitor_id: 6)
MatchupsCompetitor.create(matchup_id:  6, competitor_id: 7)
MatchupsCompetitor.create(matchup_id:  7, competitor_id: 7)
MatchupsCompetitor.create(matchup_id:  7, competitor_id: 8)
