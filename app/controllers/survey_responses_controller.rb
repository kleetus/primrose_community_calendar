class SurveyResponsesController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
  end
  
  def new
    @sr = SurveyResponse.create(:question_id => params[:question_id])
  end
  
  def edit
    @sr = SurveyResponse.find(params[:id])
  end
  
  def destroy
    SurveyResponse.destroy(params[:id])
    redirect_to campaign_question_survey_responses_url
  end
  
  def create
    @survey_response = SurveyResponse.create(:response => params[:survey_response][:response], :question_id => params[:question_id])
    if @survey_response.save
        flash[:notice] = "Survey response was successfully saved!"
    else
      flash[:notice] = "There were errors on the submitted survey response."
    end
    redirect_to campaign_question_survey_responses_path(@survey_response.question.campaign_id, @survey_response.question_id, @sr)
  end
end
