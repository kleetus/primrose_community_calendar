class CampaignsController < ApplicationController
  def index
    find_all_campaigns
  end
  
  def new
    find_all_campaigns
  end
  
  def create
    @campaign = Campaign.create(:campaign => params[:campaign][:campaign])
    if @campaign.save
      render :text => "Campaign called, \"#{params[:campaign][:campaign]}\" was successfully saved!"
    else
      render :text => "There were errors on the suggested campaign."
    end
  end
  
  protected
  def find_all_campaigns
    @campaigns = Campaign.find(:all)
  end
end