class Question < ActiveRecord::Base
  has_many :survey_responses
  has_many :votes
  validates_presence_of :question, :campaign_id
  
  def to_s
    question
  end

  def response?
    survey_response ? true : false
  end  
end
