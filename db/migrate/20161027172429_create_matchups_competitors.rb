class CreateMatchupsCompetitors < ActiveRecord::Migration[5.0]
  def change
    create_table :matchups_competitors do |t|
      t.integer :matchup_id
      t.integer :competitor_id
    end
  end
end
