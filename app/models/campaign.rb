class Campaign < ActiveRecord::Base
  has_many :survey_responses
  has_many :questions
  validates_presence_of :campaign
  
  def to_s
    campaign
  end
end
