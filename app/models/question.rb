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
  
  def destroy_all
    survey_responses.each do |sr|
      SurveyResponse.destroy(sr)
    end
    Question.destroy(id)
  end
end
