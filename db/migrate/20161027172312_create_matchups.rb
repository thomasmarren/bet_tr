class CreateMatchups < ActiveRecord::Migration[5.0]
  def change
    create_table :matchups do |t|
      t.string :name
      t.float :odds
      t.datetime :deadline
      t.integer :matchup_type_id
    end
  end
end
