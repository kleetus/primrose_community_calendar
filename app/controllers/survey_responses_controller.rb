class SurveyResponsesController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
  end
  
  def new
    @question = Question.find(params[:question_id])
  end
  
  def create
    @survey_response = SurveyResponse.create(:response => params[:survey_response][:response], :question_id => params[:question_id])
    if @survey_response.save
        flash[:notice] = "Survey response was successfully saved!"
    else
      flash[:notice] = "There were errors on the submitted survey response."
    end
    redirect_to new_campaign_question_survey_response_path
  end
end
