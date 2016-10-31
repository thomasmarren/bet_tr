class AddWinnerToMatchupsCompetitors < ActiveRecord::Migration[5.0]
  def change
    add_column :matchups_competitors, :winner, :boolean
  end
end
