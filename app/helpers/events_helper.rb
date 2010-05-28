module EventsHelper
  def month_map
    {'January' => 1, 'February' => 2, 'March' => 3, 'April' => 4, 'May' => 5, 'June' => 6, 
    'July' => 7, 'August' => 8, 'September' => 9, 'October' => 10, 'November' => 11, 'December' => 12}
  end
    
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
      today_class = " today" if day == @now.day && @month == @now.month
      ret += "<td month='#{@start_time.month}' word_month='#{@start_time.strftime("%B")}' year='#{@start_time.year}' id='#{@current_month}_#{day}' class='#{num_class+today_class}'>
              <div class='day_wrapper'><span>#{day}</span>
              #{print_event_block(@year, @current_month, day)}</div></td>"
    end
    ret += "</tr>"
  end
  
  def print_event_block(year, month, day, events=@all_events)
    time_string = "#{year}-#{month}-#{day}"
    if events.has_key? time_string
      todays_events = "<p><div class='todays_events'>"
      event = events[time_string]
      if event['display_name']
        todays_events += event['name']
      else
        todays_events += "Name withheld"
      end
      todays_events += "--></div><div class='todays_events'>#{event['start_time'].strftime('%I:%M %p')}</div></p>"
    end
    todays_events
  end
  
end
