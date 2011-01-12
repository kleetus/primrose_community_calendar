class QuestionsController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
  end
  
  def new
    @campaign = Campaign.find(params[:campaign_id])
  end
  
  def create
    @question = Question.create(:question => params[:question][:question], :campaign_id => params[:campaign_id])
    if @question.save
        flash[:notice] = "Question called, \"#{params[:question][:question]}\" was successfully saved!"
    else
      flash[:notice] = "There were errors on the submitted question."
    end
    redirect_to new_campaign_question_path
  end
end
