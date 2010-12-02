class CreateSurveyResponses < ActiveRecord::Migration
  def self.up
    create_table :survey_responses do |t|
      t.column :response, :text
      t.column :question_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_responses
  end
end
