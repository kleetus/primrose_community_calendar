$(function() {
  $("#event_form").dialog({autoOpen:false});
  $("#event_submit").dialog({autoOpen:false});
  $("td").click(function(){
    var year = $(this).attr("year");
    var month = parseInt($(this).attr("month"));
    var now = new Date();
    var day = $(this).attr("id").split('_')[1];
    var selected_date = new Date(year, month-1, day);
    if(selected_date<now) return;
    $("#event_form").dialog("open");
    $("#main_event_label").html("Setting Event for " + $(this).attr("word_month") + " " + $("#"+this.id+" > .day_wrapper > span").html()  + ", " + $(this).attr("year"));
    $("#events_month").val(month);
    $("#events_year").val(year);
    $("#events_day").val(day);
  });
});

restyle_callback_element = function() {
  $("#event_submit").dialog("open");
  $("#event_form").dialog("close");
}

loading = function() {
  $('#events_submit').hide();
}

move_month = function(direction) {
  var month = parseInt($("#month").attr("month"));
  var year = parseInt($("#year").attr("year"));
  switch(direction)
  {
    case 1:
      month = (month % 12) + 1
      if(month == 1){year++;}
      break;
    case -1:
      month = ((12+(month-2)) % 12) + 1
      if(month == 12){year--;}
      break;
    default:
      break;
  }
  window.location = "/events?month=" + month + "&year=" + year;
}

add_event_to_calendar = function() {
  var month_year = $("#this_event").attr("monthyear");
  var day = month_year.split("_")[1];
  var day_num = "<span>"+day+"</span>";
  $("#"+month_year+" > .day_wrapper").html(day_num+$("#this_event").html());
}
