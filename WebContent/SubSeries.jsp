<%@ include file="Main.jsp"%>
<script src="<%=request.getContextPath()%>/js/AesUtil.js"></script>
<script src="<%=request.getContextPath()%>/js/pbkdf2.js"></script>
<script src="<%=request.getContextPath()%>/js/aes.js"></script>

<div class="main_content">
	<div class="breadCrumb module">
		<ul class="text-center">
			<li style="color: #0083bb;"><h4>
					<b>Sub Series</b>
				</h4></li>
		</ul>
	</div>	
		<div id="jCrumbs" class="breadCrumb module">
		<div style="overflow: hidden; position: relative; width: 1065px;">
			<div>
				<ul style="width: 5006px;">
					<li class="first"><a href="#"><i
							class="glyphicon glyphicon-home"></i></a></li>
					<li>Report</a></li>
					<!-- 	<li><a href="#">2.3</a></li> -->
					<li ><a href="<%=request.getContextPath()%>/Series.jsp"><b>Common Reporting</b></a></li>
					<li class="last" id="seriesname"><b></b></li>
				</ul>
			</div>
		</div>
	</div>
	<section class="content_b">
		<div class="row">
			<div class="col-md-12">
				<div id="report"></div>
				
			</div>
		</div>
	</section>

	<script type="text/javascript">
	function getUrlVars() {
	    var vars = {};
	    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
	        vars[key] = value;
	    });
	    return vars;
	}
	//List of Reports
	getsearch();
	
	function getsearch() {
		var number = getUrlVars()["req"];		
		var o = "<%=itcnt%>";
		var j = "<%=ksize%>";
		var  m = "<%=iv%>";
		var l = "<%=salt%>";			
		var k = new AesUtil(j, o);	
		var result = k.decrypt(l, m, "data", number);			
		var id=result;
		if(id!="No"){
			var sid ="",sno="",sname="";
			var fields = id.split(/~/);
			 sid = fields[0];
			 sno = fields[1];
			 sname = fields[2];
			
		if (typeof sno != 'undefined'){
				$("#seriesname").html(sno+" "+sname);
		}else{
			$("#seriesname").html("");
		}
$.ajax({
			type : "post",
			url : path + "/Fetching_Sub_Series_List_Details",
			async : false,
			data:{id:sid},
			success : function(h) {
				var a = h.trim();				
				var j = JSON.parse(a);			
				var cond='<table class="table table-striped table-bordered table-condensed display"	 style="width:1200px;" cellspacing="0" width="100%" id="reportdata"><thead><tr><th class="text-center"></th><th class="text-center"></th><th class="text-center">Name</th><th class="text-center">Modified</th><th class="text-center">Actions</th></tr></thead><tbody>';
				if(j.length>0){
				$.each(j,function(a, b) {
				cond=cond+"<tr><td  style='width:5px;'></td><td style='width:25px;'><i class='splashy-application_windows_okay'><i class='splashy-arrow_state_blue_right'></i></i></td><td><a href='javascript:void(0);' onclick='getsubseriesfw(\""+b.series_serialNo+"\",\""+b.series_name+"\");'>"+b.series_serialNo+" "+b.series_name+"</a></td><td style='width:20px'>"+b.modifieddatetime+"</td><td style='text-align:Center;width:10px'><a  href='javascript:void(0);' onclick='getremove(\""+b.id+"\",\"subseries\");'><i class='splashy-error_x'></i></td></tr>";
				});			
				}
				else{
					//cond=cond+"<tr><td colspan='5'>No data available</td></tr>";	
				}
				$("#report").html(cond+"</tbody></table>");
				$("#reportdata").dataTable().fnDestroy();
				
				  (function(){$(document).ready(function(t){return function(){"use strict";$("#reportdata").dataTable({
					  "paging":   false, destroy: true, "info":     false,  scrollX : true,
					  "columnDefs": [{
						    "defaultContent": "-",
						    "targets": "_all"
						  }]
				  });
				  
				  }}(this))}).call(this);
			    },
				error : function() {
				},
				complete : function() {
							
			    }
		});
	return false;
		}
}
function getsubseriesfw(id,name){
		
	var seriestfltr = id.charAt(0);
	
		var o = "<%=itcnt%>";
		var j = "<%=ksize%>";
		var  m = "<%=iv%>";
		var l = "<%=salt%>";			
		var k = new AesUtil(j, o); 
		var req = id+"~"+name;
	
		var req = k.encrypt(l, m, "data", req);
		
	//	alert(req);
		//alert(k.decrypt(l, m, "data", req) );
		
		if(seriestfltr=="1"){
			document.location.href="Sec_Details_fst.jsp?req="+req;
			}
		
		if(seriestfltr=="2"){
		document.location.href="Sec_Details.jsp?req="+req;
		}if(seriestfltr=="3"){
			document.location.href="Sec_Details_thr.jsp?req="+req;
		}
		if(seriestfltr=="4"){
			document.location.href="Sec_Details_fr.jsp?req="+req;
		}

		if(seriestfltr=="5"){
			document.location.href="Sec_Details_fv.jsp?req="+req;
		}
		if(seriestfltr=="6"){
			document.location.href="Sec_Details_sx.jsp?req="+req;
		}
		if(seriestfltr=="7"){
			document.location.href="Sec_Details_seven.jsp?req="+req;
		}

		if(seriestfltr=="8"){
			document.location.href="Sec_Details_egt.jsp?req="+req;
		}

}
	function getremove(id,val){
		
			
			bootbox.confirm({
			    message: "Are you sure want to delete this series?",
			    buttons: {
			        confirm: {
			            label: 'Yes',
			            className: 'btn-success'
			        },
			        cancel: {
			            label: 'No',
			            className: 'btn-danger'
			        }
			    },
			    callback: function (result) {
			        console.log('This was logged in the callback: ' + result);
			       // alert(result);
			        if(result==true){
			        //	alert("");
			$.ajax({
				type : "post",
				url : path + "/Removing_Series_Details",
				data : {
					val : val,id:id
				},
				async : false,
				success : function(i) {
					var b = i.trim();
					var c = "<%=itcnt%>";
					var h = "<%=ksize%>";
					var e = "<%=iv%>";
					var f = "<%=salt%>";
								var g = new AesUtil(h, c);
								var d = g.decrypt(f, e, "data", b);
								var q = d;
								if (q == "SUCCESS") {

									bootbox.alert("Removed Successfully",
											function() {
												location.reload();
											});

								} else {
									swal({
										text : "Please try again",
										type : "danger",
										confirmButtonColor : "green",
										confirmButtonText : "OK"
									})
								}
							},
							error : function() {
							},
							complete : function() {
							}
						});

					}
				}
			});

		}
	</script>
</div>