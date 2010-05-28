class EventsController < ApplicationController
  include EventsHelper
  
  def index
    @now = Time.now
    @month = params.has_key?("month") ? params["month"].to_i : @now.month
    @year = params.has_key?("year") ? params["year"].to_i : @now.year
    ae = Event.find(:all, :order => "start_time")
    @all_events = {}
    ae.each do |event|
      date = "#{event['start_time'].year}-#{event['start_time'].month}-#{event['start_time'].day}"
      @all_events[date] =  event
    end
    view = 'calendar'
    calendar_view = 'monthly'
    view = params[:view_type] if params.has_key? :view_type
    calendar_view = params[:calendar_view] if params.has_key? :calendar_view
    if view == 'admin_list'
      render :partial => 'admin_list'
    end
  end
  
  def create
    render :status => 400, :text => "error, nothing submitted" unless params.has_key? :events
    @year, @month, @day = params[:events]["year"], params[:events]["month"], params[:events]["day"]
    start_time = "#{@year}-#{@month}-#{@day} #{params[:events]["start_time(4i)"]}:#{params[:events]["start_time(5i)"]}"
    @event = Event.new(
      :start_time => start_time,
      :email => params[:events][:email],
      :address => params[:events][:address],
      :phone => params[:events][:phone],
      :name => params[:events][:name],
      :add_mailing_list => params[:events][:add_mailing_list],
      :display_name => params[:events][:display_name])
    if @event.save
      render :partial => "success"
    else
      render :status => 400, :partial => "error"
    end
  end
  
end
