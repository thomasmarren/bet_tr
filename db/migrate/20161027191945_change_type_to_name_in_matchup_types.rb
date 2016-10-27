class ChangeTypeToNameInMatchupTypes < ActiveRecord::Migration[5.0]
  def change
    rename_column :matchup_types, :type, :name
  end
end
