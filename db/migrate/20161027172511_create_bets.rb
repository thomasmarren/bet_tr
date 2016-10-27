class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :matchups_competitors_id
      t.integer :amount
    end
  end
end
