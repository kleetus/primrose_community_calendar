class Question < ActiveRecord::Base
  has_one :survey_response
  validates_presence_of :question
  
  
  def to_s
    question
  end
end
