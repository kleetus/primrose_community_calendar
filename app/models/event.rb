class Event < ActiveRecord::Base
  validates_presence_of :name, :address, :phone, :start_time, :end_time
  MAX_EVENT_LENGTH = 8*3600
  
  def validate
    start_time_prime = start_time - (MAX_EVENT_LENGTH)
    end_time_prime = end_time + (MAX_EVENT_LENGTH)
    overlap_events = Event.find(:all, :conditions => ["end_time<='#{end_time_prime.strftime("%Y-%m-%d %H:%M:%S")}' and start_time>='#{start_time_prime.strftime("%Y-%m-%d %H:%M:%S")}'"])
    return true if overlap_events.empty?
    delta = (start_time.to_i..end_time.to_i).to_a
    overlap_events.each do |e|
      unless (delta & (e.start_time.to_i..e.end_time.to_i).to_a).empty?
        errors.add(:start_time, "There is a conflicting event")
      end
    end
    errors
  end
end
