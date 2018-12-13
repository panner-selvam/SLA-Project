
$(document).ready(function (){

	$("#ipAddress").focusout(function(){
		var ip = $("#ipAddress").val();
		ip=ip.trim();
		if(ip!=''){
			var ipformat = /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
			if(ip.match(ipformat))
			{
				return true;
			}
			else
			{	
				bootbox.dialog({
	                message: "You have entered an invalid IP address!"
	            });
				$("#ipAddress").val('');
				document.getElementById("save").disabled = true;
				return false;
			}
		}
	        
	});
	$(".numberonly").keypress(function(e){
		 if ((e.which > 47 && e.which < 58)){
	        	return true;
		 }else{
			 return false;
		 }
	 });
	$(".number_and_dot").keypress(function(e){
		 if ((e.which > 47 && e.which < 58)||(e.which == 46)){
	        	return true;
		 }else{
			 return false;
		 }
	 });
	
	$(".not_null").keypress(function(e){
		alert(e.preventDefault());
		/* if (e.preventDefault()){
	        	return true;
		 }else{
			 return false;
		 }*/
	 });
	$("#ipAddress").keypress(function (e) {
		if ((e.which > 47 && e.which < 58)||(e.which == 46)){
        	return true;
		}else{
			return false;
		}
	});
	
	

	 
	
});

function get_id_value(value){
	var percentage_value = $('#'+value).val();
	
	if(percentage_value!=''){
		percentage_value = parseFloat(percentage_value);
	     if(percentage_value<=100){
	    	return true;
	    }else{
	    	bootbox.dialog({
	            message: "You have entered an invalid Percentage Value!"
	        });
	    	$('#'+value).val('');
	    	document.getElementById("save").disabled = true;
	    	return false;
	    }    
	}
}




