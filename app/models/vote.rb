class Vote < ActiveRecord::Base
  validates_presence_of :voter_id, :question_id, :survey_response_id
  
end
