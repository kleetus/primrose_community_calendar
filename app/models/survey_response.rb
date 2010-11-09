class SurveyResponse < ActiveRecord::Base
  has_one :question
end
