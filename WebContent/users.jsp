<%@ include file="Main.jsp"%>
<style>

#showAll,#superAdmin,#Admin,#User{
	border-color : #ddd;
	background-color : white;
	color : black;
	margin-left:20px;
}
#showAll:focus,#superAdmin:focus,#Admin:focus,#User:focus{
    background: #0083bb;
    color : white;
}
#showAll:hover,#superAdmin:hover,#Admin:hover,#User:hover{
	background-color :#999999;
	color : white;
} 
#right{
	float:right;
	font-weight : bold;
	margin-right : -15px;
}
#userDetails,th,td{
	padding : 5px;
}
.editField,#updateBtn{
	display : none;
	
}
</style>
<body class="full_width">
	<div id="maincontainer" class="clearfix">
	

		<div id="contentwrapper">
			<div class="main_content">
				<div id="jCrumbs" class="breadCrumb module">
					<div style="overflow: hidden; position: relative; width: 1065px;">
						<div>
							<ul style="width: 5006px;">
								<li class="first"><a href="Dashboard.jsp"><i
								class="glyphicon glyphicon-home"></i></a></li>
								<li><a href="user_reg.jsp">New User Register</a></li>
								<li class="last"><b>Users</b></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row" class="input-group">
					<button class="btn btn-primary " id="showAll"><i class="fa fa-users" aria-hidden="true"></i> Show All</button>					
					<button class="btn btn-primary"  id="superAdmin"><i class="glyphicon glyphicon-user"></i> Super Admin</button>
					<button class="btn btn-primary" id="Admin"><i class="splashy-contact_blue"></i> Admin</button>
					<button class="btn btn-primary" id="User"><i class="splashy-contact_grey"></i> User</button>
				</div>				
				<div class="row">
					<div id="users" class="All_table">
						<table class="table table-striped table-bordered table table-hover" style="width: 100%;">
							<tbody class="table table-striped table-bordered table table-hover"></tbody>
						</table>
					</div>
				</div>
				
			</div>
		</div>

	</div>
	<!-- Display the more information of selected user -->
	<div class="modal fade" id="Details" role="dialog">
    <div class="modal-dialog modal-md">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" id="btn_click" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="u_name" style="text-align: center; font-weight:700"></h4>
        </div>
        <div class="modal-body well">
        <form>
        	<table >
        		<tbody id="usersDetails"></tbody>
        	</table>	
        </form> 
        </div>  
       <div class="modal-footer">
       <button type="button" id="editBtn" class="btn btn-primary" data-toggle="modal" data-target="#editDetails" onclick="hide_label()">Edit</button>
       <button type="button" id="updateBtn" class="btn btn-primary" data-toggle="modal" data-target="#editDetails" onclick="edit_information()	">Update</button>
       	<button type="button" data-dismiss="modal" class="btn btn-danger" >Close</button>
		</div>
      </div>	
    </div>
</div> 

<!--  Details edit pop up -->
	<!-- <div class="modal fade" id="editDetails" role="dialog">
    <div class="modal-dialog modal-md">    
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" id="btn_click" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="u_name" style="text-align: center; font-weight:700"></h4>
        </div>
        <div class="modal-body well">
        <form>
        	<table >
        		<tbody id=""></tbody>
        	</table>	
        </form> 
        </div>  
       <div class="modal-footer">
       <button type="button" class="btn btn-primary" onclick="">Update</button>
       	<button type="button" data-dismiss="modal" class="btn btn-Default">Cancel</button>
		</div>
      </div>	
    </div>
</div>  -->
</body>
<script type="text/javascript">
var list="showAll";
var current_user_id="";
onload();
$(document).ready(function(){
	
	$("#showAll").click(function(){ 
		list = "showAll";
		onload();
	});
	
	$("#superAdmin").click(function(){ 
		list = "Super Admin";
		onload();
    });
	
	$("#Admin").click(function(){ 
		list = "Admin";
		onload();
    });
	
	$("#User").click(function(){ 
		list = "User";
		onload();
    });

});


function onload(){
	
	$.ajax({
		
		type : "POST",
		url : path +"/Fetching_user_details",
		async : false,
		data:{list:list},
		success : function(data) { 
			var temp = JSON.parse(data);
			list_all(temp);
		},
		error : function(xhr, errorType, exception) {
			alert("Error :"+xhr.status);
		},
		complete : function() {}
	});
	return false; 
	
	
	function list_all(temp){
		
		var obj = temp;
		 var k='<table class="table table-striped table-bordered table table-hover"  style="width:100%;">';
			k+='<thead>';
				k+='	<tr>';
					k+='		<th>S.No</th>';
						k+='		<th>Officer Name</th>';
							k+='	<th>Username</th>';
							k+='	<th>Department</th>';
							k+='	<th>Role</th>';
							k+='	<th></th>';
							k+='	<th></th>';
							k+='</tr>';
							k+=' </thead>';
							k+='<tbody class="table table-striped table-bordered table table-hover">';
		if ((obj == "")||(obj == null)) {
			k+='<tr>';
			k += '<td colspan="9" style="text-align: center;" >NO USERS IN THIS LIST</td>';
			k+='</tr>';

		k+='</tbody></table>';
		document.getElementById('users').innerHTML = k;

		} else { 
			var s = 0;
			$.each(obj, function(key, data) {				
				s++;
				k += '<tr>';
				k+= '<td>'+s+'</td>';
				k += '<td>' + data.officer_name+'</td>';
				k += '<td>' + data.username + '</td>';
				k += '<td>' + data.department + '</td>';
				k += '<td>' + data.role + '</td>';
				k += '<td style="text-align: center;"><i id="viewEye" class="fa fa-info-circle" style="font-size: 18px;  cursor: pointer; color:#25ade4;" data-toggle="modal" data-target="#Details" onclick="view_more('+data.id+')"></i></td>';
				k +='<td style="text-align: center;" ><i class="splashy-error_x" id="" style="font-size: 18px;  cursor: pointer;" onclick="delete_user('+data.id+')"></i></td>'
				k += '</tr>';        		
			});
			k += '</tbody></table>';
			document.getElementById('users').innerHTML = k;

		}
		
	}

	
}
var username="";
function view_more(id){
	var t=id;
	$.ajax({			
			type : "GET",
			url : path +"/Fetching_user_details",
			async : false,
			data:{id:t},
			success : function(data) { 
				var temp = JSON.parse(data);
				$.each(temp,function (key, data){	
					current_user_id = data.id;
					$("#u_name").html(data.officer_name+"s Details");
					
						var k="";
							k+='<tr><th>User ID</th><td>:</td><td class="labelField">'+data.id+'</td><td><input type="text" id="updateId" class="form-control editField" value="'+data.id+'" disabled><td></tr>';
							k+='<tr><th>Officer Name</th><td>:</td><td class="labelField">'+data.officer_name+'</td><td><input type="text" id="updateOfficerName" class="form-control editField" value="'+data.officer_name+'"><td></tr>';
							k+='<tr><th>Username</th><td>:</td><td class="labelField">'+data.user_name+'</td><td><input type="text" id="updateUsername" class="form-control editField" value="'+data.user_name+'" disabled><td></tr>';
							k+='<tr><th>Password</th><td>:</td><td class="labelField">'+data.password+'</td><td><input type="text" id="updatePassword" class="form-control editField" value="'+data.password+'"><td></tr>';
							k+='<tr><th>Department</th><td>:</td><td class="labelField">'+data.department+'</td><td><input type="text" id="updateDepartment" class="form-control editField" value="'+data.department+'"><td></tr>';
							k+='<tr><th>Role</th><td>:</td><td class="labelField">'+data.role+'</td><td><input type="text" id="updateRole" class="form-control editField" value="'+data.role+'"><td></tr>';
							k+='<tr><th>Mobile No</th><td>:</td><td class="labelField">'+data.mobile_no+'</td><td><input type="text" id="updateMobileNo" class="form-control editField" value="'+data.mobile_no+'"><td></tr>';
							k+='<tr><th>Registered Date</th><td>:</td><td class="labelField">'+data.registered_date+'</td><td><input type="text" id="updateRegDate" class="form-control editField" value="'+data.registered_date+'" disabled><td></tr>';
							document.getElementById('usersDetails').innerHTML = k;
							
				});
			},
			error : function(xhr, errorType, exception) {
				alert("Error :"+xhr.status);
			},
			complete : function() {}
		});
		return false;
}

function delete_user(id){
	var t = id;
	  bootbox.confirm("Do you want permanently delete this record",function(result){
		  if (result == true) {
			  delete_user_call(t);
		  }
	  });
	  
}
function delete_user_call(t){ 
	var id = t;
	  $.ajax({
		  type :"POST",
		  url : path+"/Delete_user",
		  async : false,
		  data : {id:id},
		  success : function (data){
			  var result = data.trim();
			  if(result=="SUCCESS"){
				  var dialog = bootbox.dialog({
					    title: 'Delete User',
					    message: '<p><i class="fa fa-spin fa-spinner"></i> Removing user...</p>'
					});
					dialog.init(function(){
					    setTimeout(function(){
					    	dialog.modal('hide');
					    	//$("#Details").hide();
					    	onload(list);
					    }, 1000);
					});
			  } 
			  
		  },
		  error : function (){
			  
		  },
		  complete : function (){
			  
		  }
		  
	  }); 
	  return false;
}

 function hide_label(){
	$(".labelField").hide();
	$("#editBtn").hide();
	$(".editField").show();
	$("#updateBtn").show();
	
} 

$('#Details').on('hidden.bs.modal', function (e) {
	$(".editField").hide();
	$("#updateBtn").hide();
	$("#editBtn").show();
}); 



function edit_information(){

	id = $('#updateId').val();
	officer_name = $('#updateOfficerName').val();
	username = $('#updateUsername').val();
	password = $('#updatePassword').val();
	department = $('#updateDepartment').val();
	role = $('#updateRole').val();
	mobile_no = $('#updateMobileNo').val();
	//reg_date = $('#updateRegDate').val();
	
		$.ajax({
		type : "post",
		url : path+"/Edit_db_user_details",
		async : false,		
		data : {id:id,
			officer_name:officer_name,
			username:username,
			password:password,
			department:department,
			role:role,
			mobile_no:mobile_no
			//reg_date:reg_date
		},
		success : function (data){	
			
			var status = data; 
			status = data.trim();
			 
			if(status == "success"){
				var dialog = bootbox.dialog({
				    title: 'Updating User',
				    message: '<p><i class="fa fa-spin fa-spinner"></i> Updating record...</p>'
				});
				dialog.init(function(){
				    setTimeout(function(){
				    	dialog.modal('hide');
				    	onload(list);
				    }, 1000);
				});	
			}else{
				bootbox.alert("Error");
			}
			
		},
		error  : function (){
			
		},
		complete : function (){
			
		}
	});
	return false;
	
	 
}
</script>


