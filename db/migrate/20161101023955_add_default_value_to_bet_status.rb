class AddDefaultValueToBetStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :bets, :status, :string, :default => "open"
  end
end
