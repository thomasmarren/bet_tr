class AddStatusToBets < ActiveRecord::Migration[5.0]
  def change
    add_column :bets, :status, :string
  end
end
