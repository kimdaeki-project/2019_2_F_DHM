document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  
		  var calendar = new FullCalendar.Calendar(calendarEl, {
			  locale:'ko',
		    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
		    defaultView: 'dayGridMonth',
		    defaultDate: '${dDate}',
		    header: {
		      left: 'prev,today',
		      center: 'title',
		      right: 'next'
		    },
		    eventColor: 'green',
		    height:450,
		    
		    events : [
		    	
		    	]
		  });
		  calendar.render();
		});

var sch = {};
sch.title = '출발';
sch.start='2020-03-07';

$(".sch-eventList").each(function() {
	sch = {};
	sch.title = $(this).prop("id");
	sch.start = $(this).prop("title");
	sch.end = $(this).val();
	sch.color = color[i%4];
});