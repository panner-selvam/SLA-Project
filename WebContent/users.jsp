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
								<li><a href="#">Report</a></li>
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
					<div id="series_chart" class="All_table">
						<table class="table table-striped table-bordered table table-hover" style="width: 100%;">
							<tbody class="table table-striped table-bordered table table-hover"></tbody>
						</table>
					</div>
				</div>
				
			</div>
		</div>

	</div>
	
	<div class="modal fade" id="Details" role="dialog">
    <div class="modal-dialog modal-md">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" id="btn_click" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="u_name"></h4>
        </div>
        <div class="modal-body">
        <form>
        	<div class="row well">
        		<div class="col-md-3 ">
        			<label id="right">User ID  :</label>
        		</div>
        		<div class="col-md-9 ">
        			<label id="ID"> </label>
        		</div>
        		<div class="col-md-3 ">
        			<label id="right">Officer Name  :</label>
        		</div>
        		<div class="col-md-9 ">
        			<label id="officerName"> </label>
        		</div>
        		<div class="col-md-3 ">
        			<label id="right">Username  :</label>
        		</div>
        		<div class="col-md-9 ">
        			<label id="Username"> </label>
        		</div>        	
        		<div class="col-md-3 ">
        			<label id="right">Password  :</label>
        		</div>
        		<div class="col-md-9 ">
        			<label id="Password"> </label>
        		</div>       	
        		<div class="col-md-3">
        			<label id="right">Department  :</label>
        		</div>
        		<div class="col-md-9">
        			<label id="Department"> </label>
        		</div>        	
        		<div class="col-md-3 ">
        			<label id="right">Role  :</label>
        		</div>
        		<div class="col-md-9 ">
        			<label id="Role"> </label>
        		</div>       
        		<div class="col-md-3 ">
        			<label id="right">Registered Date :</label>
        		</div>
        		<div class="col-md-9 ">
        			<label id="registeredDate"> </label>
        		</div>
        	</div>	
        </form>
        </div>
        <div class="modal-footer">
          <button type="button" data-dismiss="modal" class="btn btn-danger">CLOSE</button>
        </div>
      </div>	
    </div>
</div> 
</body>
<script type="text/javascript">
var list="showAll";
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
							k+='	<th>More Details</th>';
									k+='</tr>';
										k+=' </thead>';

											k+='<tbody class="table table-striped table-bordered table table-hover">';
		if ((obj == "")||(obj == null)) {
			k+='<tr>';
			k += '<td colspan="9" style="text-align: center;" >NO USERS IN THIS LIST</td>';
			k+='</tr>';

		k+='</tbody></table>';
		document.getElementById('series_chart').innerHTML = k;

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
				k += '<td><i id="viewEye" class="glyphicon glyphicon-eye-open" style="font-size: 18px;  cursor: pointer;" data-toggle="modal" data-target="#Details" onclick="view_more('+data.id+')"></i></td>';
				k += '</tr>';        		
			});
			k += '</tbody></table>';
			document.getElementById('series_chart').innerHTML = k;

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
						$('#ID').text(data.id);
						$('#officerName').text(data.officer_name);
						$('#Username').text(data.user_name);
						$('#Password').text(data.password);
						$('#Department').text(data.department);
						$('#Role').text(data.role);
						$('#registeredDate').text(data.registered_date);
						$('#u_name').text(data.officer_name+" Details");
				});
			},
			error : function(xhr, errorType, exception) {
				alert("Error :"+xhr.status);
			},
			complete : function() {}
		});
		return false;
}
	
	
</script>


