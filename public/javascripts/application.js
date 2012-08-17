$(document).ready(function() {
	
	$('table.tasks td.check input').change(function() {
		var task_id = $(this).attr('value');
		$.ajax({
			url:'/tasks/' + task_id + '/complete',
			type:'PUT',
			error:function(xhr) {
				alert("Task could not be completed. Please try again in a moment.")
			}
		});
	});
	
});