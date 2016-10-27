class CreateMatchupType < ActiveRecord::Migration[5.0]
  def change
    create_table :matchup_types do |t|
      t.string :type
    end
  end
end
