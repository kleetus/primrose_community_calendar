class Vote < ActiveRecord::Base
  belongs_to :voter
  validates_presence_of :voter_id, :question_id, :survey_response_id
  
end
