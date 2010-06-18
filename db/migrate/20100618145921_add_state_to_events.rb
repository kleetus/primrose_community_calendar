class AddStateToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :current_state, :string
  end

  def self.down
    remove_column :events, :current_state
  end
end
