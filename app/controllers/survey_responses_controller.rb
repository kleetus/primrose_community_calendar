class SurveyResponsesController < ApplicationController
  def index
    @survey_responses = SurveyResponses.find(:all)
  end
  
  
  def create
  end
end
