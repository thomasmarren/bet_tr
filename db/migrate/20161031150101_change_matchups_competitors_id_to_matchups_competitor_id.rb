class ChangeMatchupsCompetitorsIdToMatchupsCompetitorId < ActiveRecord::Migration[5.0]
  def change
    rename_column :bets, :matchups_competitors_id, :matchups_competitor_id
  end
end
