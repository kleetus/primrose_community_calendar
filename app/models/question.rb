class Question < ActiveRecord::Base
  has_one :survey_response
  has_many :votes
  validates_presence_of :question
  
  def to_s
    question
  end

  def response?
    survey_response ? true : false
  end
end
