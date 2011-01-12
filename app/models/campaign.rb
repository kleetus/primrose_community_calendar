class Campaign < ActiveRecord::Base
  has_many :survey_responses
  has_many :questions
  validates_presence_of :campaign
  
  def to_s
    campaign
  end
  
  def destroy_all
    questions.each do |q|
      q.destroy_all
    end
    Campaign.destroy(id)
  end
end
