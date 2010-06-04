class EventsController < ApplicationController
  include EventsHelper
  
  def index
    @now = Time.now
    @month = params.has_key?("month") ? params["month"].to_i : @now.month
    @year = params.has_key?("year") ? params["year"].to_i : @now.year
  end
  
  def create
    render :status => 400, :text => "error, nothing submitted" unless params.has_key? :events
    @year, @month, @day = params[:events]["year"], params[:events]["month"], params[:events]["day"]
    start_time = Time.mktime(@year.to_i, @month.to_i, @day.to_i, params[:events]["start_time(4i)"].to_i, params[:events]["start_time(5i)"].to_i)
    end_time = start_time + (3600*params[:events][:hours_needed].to_i)
    @event = Event.new(
      :start_time => start_time,
      :end_time => end_time,
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
  
  def admin
    @events = Event.find(:all)
  end
end
