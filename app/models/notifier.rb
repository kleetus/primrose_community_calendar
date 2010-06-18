class Notifier < ActionMailer::Base
  def event_notification(event)
    recipients event.email
    cc         'allycat415@gmail.com'
    from       "noreply@example.com"
    subject    "Thank you for scheduling a clubhouse event"
    body       :event => event
  end  
  
  def state_change_notification(event)
    recipients event.email
    cc         'allycat415@gmail.com'
    from       "noreply@example.com"
    subject    "Your event for #{event.start_time.strftime("%m/%d/%Y")} has been #{event.state}."
    body       :event => event
  end
end
