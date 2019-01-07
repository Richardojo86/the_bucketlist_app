$(function(){
	$("#bucket_form").on("submit", function(event){
		$.ajax({
			type: "POST",
			url: this.action,
			data: $(this).serialize(),
			success: function(response) {
				//update the DOM
			}
		});
		event.preventDefault();
	});
})