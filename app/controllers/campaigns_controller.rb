class CampaignsController < ApplicationController
  def index
    find_all_campaigns
  end
  
  def show
    @campaign = Campaign.find(params[:id])
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def create
    @campaign = Campaign.create(:campaign => params[:campaign][:campaign])
    if @campaign.save
      flash[:notice] = "Campaign called, \"#{params[:campaign][:campaign]}\" was successfully saved!"
    else
      flash[:notice] = "There were errors on the submitted campaign."
    end
    redirect_to campaigns_path
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
  end
  
  def update
    Campaign.update(params[:id], params[:campaign])
    flash[:notice] = "Campaign saved!"
    redirect_to edit_campaign_url(params[:campaign])
  end
  
  def destroy
    @c = Campaign.find(params[:id])
    @c.destroy_all
    redirect_to campaigns_url
  end
  
  def publish
    #this makes the campaign visible at a url
    
  end
  
  protected
  def find_all_campaigns
    @campaigns = Campaign.find(:all, :order => "created_at DESC")
    if params[:active_campaign] and @campaigns
      @campaigns.each do |c|
        if c.id == params[:active_campaign].to_i
          @campaigns.delete(c)
          @campaigns.unshift(c)
          break
        end
      end
    end
  end
end