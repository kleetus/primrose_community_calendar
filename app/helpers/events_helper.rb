module EventsHelper
  def days_in_month(month, year)
    Date.new(year, month, -1).day
  end
  
  def days_array_by_month
    month_array = (1..days_in_month(@month, @year)).to_a
    month, year = @month == 1 ? [12, @year-1] : [@month-1, @year]
    days_in_prev_month = days_in_month(month, year)
    while @start_index > 0
      month_array.insert(0, days_in_prev_month)
      days_in_prev_month -= 1
      @start_index -= 1
    end
    if (days_next_month = 7 - (month_array.length % 7)) > 0
      (month_array << (1..days_next_month).to_a).flatten!
    end
    return month_array
  end

  def create_calendar_body
    @start_time = Time.mktime(@year,@month,1)
    @start_index = @start_time.strftime("%w").to_i
    @start_time -= (86400*15)
    ret = "<tr>"
    soft_nums = true
    num_class = "soft_nums_#{soft_nums.to_s}"
    @current_month = @month - 1
    days_array_by_month.each_with_index do |day, i|
      today_class = ""
      if i % 7 == 0 and i != 0
        ret += "</tr><tr>"
      end
      if day == 1
        @current_month += 1
        num_class = "soft_nums_#{(soft_nums = !soft_nums).to_s}"
        @start_time += (86400*31)
      end
      today_class = " today" if day == @now.day && @current_month == @now.month
      ret += "<td month='#{@start_time.month}' word_month='#{@start_time.strftime("%B")}' year='#{@start_time.year}' id='#{@current_month}_#{day}' class='#{num_class+today_class}'>
              <div class='day_wrapper'><span>#{day}</span>
              #{get_days_events(@year, @current_month, day)}</div></td>"
    end
    ret += "</tr>"
  end
  
  def get_days_events(year, month, day)
    month, day = [month.to_s, day.to_s].map! {|t| t.length==1 ? t="0"+t : t}
    time_string = "#{year}-#{month}-#{day}"
    events = Event.find(:all, :conditions => ["start_time>='#{time_string} 00:00:00' and start_time<='#{time_string} 23:59:59'"])
    ret = ''
    events.each do |event|
      ret += "<p><div class='todays_events'>"
      if event['display_name']
        ret += event['name']
      else
        ret += "Name withheld"
      end
      ret += "--></div><div class='todays_events'>#{event['start_time'].strftime('%I:%M %p')}</div></p>"
    end
    ret
  end  
end
