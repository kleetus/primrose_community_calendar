class Notifier < ActionMailer::Base
  def event_notification(event)
    recipients event.email
    cc         'allycat415@gmail.com'
    from       "noreply@example.com"
    subject    "Thank you for scheduling a clubhouse event"
    body       :event => event
  end  
end
