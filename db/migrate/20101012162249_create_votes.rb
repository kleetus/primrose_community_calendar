class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.column :voter_id, :integer
      t.column :question_id, :integer
      t.column :survey_response_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
