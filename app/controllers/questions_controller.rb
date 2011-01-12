class QuestionsController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def new
    @campaign = Campaign.find(params[:campaign_id])
  end
  
  def update
    Question.update(params[:id], params[:question])
    flash[:notice] = "Question saved!"
    redirect_to campaign_questions_url(params[:campaign_id])
  end
  
  def create
    @question = Question.create(:question => params[:question][:question], :campaign_id => params[:campaign_id])
    if @question.save
        flash[:notice] = "Question called, \"#{params[:question][:question]}\" was successfully saved!"
    else
      flash[:notice] = "There were errors on the submitted question."
    end
    redirect_to campaign_questions_path(@question.campaign_id)
  end
  
  def destroy
    @q = Question.find(params[:id])
    campaign_id = @q.campaign_id
    @q.destroy_all
    redirect_to campaign_questions_url(campaign_id)
  end
end
