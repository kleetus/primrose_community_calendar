class Event < ActiveRecord::Base
  include AASM
  validates_presence_of :name, :address, :phone, :start_time, :end_time
  MAX_EVENT_LENGTH = 8*3600

  aasm_column :current_state

  aasm_initial_state :requested

  aasm_state :requested
  aasm_state :approved, :enter => :inform
  aasm_state :rejected, :enter => :inform

  aasm_event :approve do
    transitions :to => :approved, :from => [:requested, :rejected]
  end

  aasm_event :reject do
    transitions :to => :rejected, :from => [:requested, :approved]
  end
  
  def acceptable?
    current_state == 'requested' or current_state == 'rejected'
  end

  def rejectable?
    current_state == 'requested' or current_state == 'approved'
  end
  
  def inform
    Notifier.deliver_state_change_notification(self)
  end
  
  def state
    current_state.titleize
  end

  def after_create
    Notifier.deliver_event_notification(self)
  end
  
  def validate
    start_time_prime = start_time - (MAX_EVENT_LENGTH)
    end_time_prime = end_time + (MAX_EVENT_LENGTH)
    matching_id = self.id ? " and id!=#{self.id}" : ""
    overlap_events = Event.find(:all, :conditions => ["end_time<='#{end_time_prime.strftime("%Y-%m-%d %H:%M:%S")}' and start_time>='#{start_time_prime.strftime("%Y-%m-%d %H:%M:%S")}'#{matching_id}"])
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
