class AddStatusToMatchups < ActiveRecord::Migration[5.0]
  def change
    add_column :matchups, :status, :string, :default => "open"
  end
end
