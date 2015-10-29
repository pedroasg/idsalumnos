class AddTournamentIdToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :tournament, index: true, foreign_key: true
  end
end
