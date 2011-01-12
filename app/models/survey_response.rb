class SurveyResponse < ActiveRecord::Base
  belongs_to :question
  has_many :votes
  validates_presence_of :question_id, :response
end
