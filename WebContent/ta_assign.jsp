<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Course Assignment</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/bootstrap-select.css" rel="stylesheet">
<link href="css/bootstrap-datetimepicker.css" rel="stylesheet">

</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Teaching Assignment System</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
					</li>

				</ul>
			</div>

		</div><!-- /.container-fluid -->
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li><a href="ta.jsp"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
			<li class="active"><a href="ta_assign.jsp"><span class="glyphicon glyphicon-stats"></span> Assign TA Course</a></li>
			<li><a href="add_ta.jsp"><span class="glyphicon glyphicon-list-alt"></span> TA</a></li>
			<li role="presentation" class="divider"></li>
			<li><a href="operation.jsp"><span class="glyphicon glyphicon-edit"></span> Operation </a></li>
		</ul>

	</div><!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Assign Course</li>
			</ol>
		</div><!--/.row-->

		<div style="padding-top:20px;"class="row">
			<div class="col-md-5">
				<div class="panel panel-default">
					<div class="panel-heading">MC Course
						<div style="float:right;">
							<div style="float:right">
							<label for="submitForm" class="btn btn-primary"> Assign </label>
						</div>
						</div>
					</div>
					<form id="data" method="post">
					<div class="panel-body">
						<div class="form-group">
							<label>Please Choose Course:</label>
							<select  id="mc_course" data-live-search="true" data-width="100%" class="selectpicker show-tick" data-size="10" name="course">
							
							</select>
						</div>
						
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select multiple id="teacher_list" data-live-search="true" data-width="100%" class="selectpicker show-tick" data-size="10" name="teacher">

							</select>
						</div>
						
						<div class="form-group">
							<label>Please Choose Week of day:</label>
							<select name="day" data-live-search="true" data-width="100%" class="selectpicker show-tick" data-size="10" name="day">
								<option value="Monday">Monday</option>
								<option value="Tuesday">Tuesday</option>
								<option value="Wednesday">Wednesday</option>
								<option value="Thursday">Thursday</option>
								<option value="Friday">Friday</option>
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Course Time:</label>
							<div class='input-group date' id='datetimepicker1'>
								<input name="from" readonly type='text' class="form-control" /> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-time"></span>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label>To:</label>
							<div class='input-group date' id='datetimepicker2'>
								<input name="to" readonly type='text' class="form-control" /> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-time"></span>
								</span>
							</div>
						</div>
							
							<div class="form-group" style="text-align:center">
                    			<button id="submitForm" type="submit" class="btn btn-primary hidden">Submit Button</button>
                    			<button id="resetForm" type="reset" class="btn btn-default hidden">Reset Button</button>
                  		</div>
					</div>
					</form>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">GE Course
						<div style="float:right;">
							<label for="submitGEForm" class="btn btn-primary"> Assign </label>
						</div>
					</div>
					<div class="panel-body">
					<form id="data_ge">
						<div class="form-group">
							<label>Please Choose Course:</label>
							<select id="ge_course" data-live-search="true" data-width="100%" class="selectpicker show-tick" data-size="10" name="course">
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select multiple id="teacher_list_1" data-live-search="true" data-width="100%" class="selectpicker show-tick" data-size="10" name="teacher">

							</select>
						</div>
						<div class="form-group" style="text-align:center">
                    			<button id="submitGEForm" type="submit" class="btn btn-primary hidden">Submit Button</button>
             
                  		</div>
					</form>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">MC Course for Other Program
						<div style="float:right;">
							<button class="btn btn-primary" type="button" name="button"> Assign </button>
						</div>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label>Please Choose Course:</label>
							<select data-live-search="true" data-width="100%" class="selectpicker dropup show-tick" data-size="10" name="course">
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select multiple id="teacher_list_2" data-live-search="true" data-width="100%" class="selectpicker dropup show-tick" data-size="10"name="teacher">

							</select>
						</div>
					</div>
				</div>
			</div>
				<div class="col-md-7">
					<div class="panel panel-default">
						<div class="panel-heading">Workload Table</div>
						<div class="panel-body">
							<table id="table" data-toggle="table" data-height="680" data-url="TestJson" >
							    <thead>
							    <tr>
							    	<th data-visible="false" data-field="operation_id" data-halign="center" data-align="center">operation_id</th>
							        <th data-field="course_name" data-halign="center" data-align="center">Course Name</th>
							        <th data-field="teacher_name" data-halign="center" data-align="center">Teacher Name</th>
							        <th data-field="operation" data-halign="center" data-align="center">Operation</th>
							    </tr>
							    </thead>
							</table>
						</div>
					</div>
				</div>
		</div><!--/.row-->
		<ul id="context-menu" class="dropdown-menu">
			<li data-item="unassign"><a>Unassign Course</a></li>
		</ul>

	</div>	<!--/.main-->


	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/sweetalert.js"></script>
	<script src="js/bootstrap-select.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/bootstrap-table-contextmenu.js"></script>
	<script src="js/moment.js"></script>
	<script src="js/bootstrap-datetimepicker.js"></script>
	
	<script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker(
        		{
        			format: 'HH:mm',
                	ignoreReadonly: true
                });
        $('#datetimepicker2').datetimepicker({
        	format: 'HH:mm',
        	ignoreReadonly: true,
        	useCurrent: false //Important! See issue #1075
        });
        $("#datetimepicker1").on("dp.change", function (e) {
            $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker2").on("dp.change", function (e) {
            $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
        });
    });
</script>


	<script>
		window.onload = function() 
		{
			UpdateList();
		};
	</script>
	
	<script>
	$('#table').bootstrapTable({
	    contextMenu: '#context-menu',
	    contextMenuAutoClickRow: true,
	    onClickRow: function(row, $el){
	       $('#table').find('.success').removeClass('success');
	       $el.addClass('success');
	    },
	    onContextMenuItem: function(row, $el)
	    {
	        if($el.data("item") == "unassign")
	        {
	        	swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover it",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                    closeModal: false,
                    })
                    .then((willDelete) => {
                    if (willDelete)
                    {
                    	var data = {
                    		    operation_id: row.operation_id
                    		};
                    	$.ajax({
                			url: "UnassignCourse",
                			type: 'POST',
                			contentType: "application/json",
                			data: JSON.stringify(data),
                			success: function (response)
                			{
                				var answer = response;
                					switch ( answer )
                					{
                						case 'success' :
                							swal("Done!", "Unassign Succeed", "success");
                								break;
                						case 'fail' :
                							swal("Unassign Failed!", "Please check your internet connection!", "error");
                								break;

                					}
                					$('#table').bootstrapTable('refresh', {silent: true});
                					UpdateList();
                	},
                	error: function (xhr, ajaxOptions, thrownError)
                	{
                	},
                	cache: false,
                	contentType: false,
                	processData: false
                });
                    }
                    else
                    {
                        return;
                    }
                        });
	        }
	    }
	});
	</script>

	<script>
		
		function UpdateList() 
		{
			GetMCList();
			GetGEList();
			GetTeacherList();
			
		}
		function GetMCList() {
			$.ajax({
				url : "TAMCCourse",
				type : 'GET',
				success : function(response) {
					$('#mc_course').html(response);
					$('.selectpicker').selectpicker('refresh');
				},
				error : function(xhr, ajaxOptions, thrownError) {
				},
				cache : false,
				contentType : false,
				processData : false
			});
		}

		function GetTeacherList() {
			$.ajax({
				url : "TAList",
				type : 'GET',
				success : function(response) {
					$('#teacher_list, #teacher_list_1, #teacher_list_2')
							.html(response);

					$('.selectpicker').selectpicker('refresh');
				},
				error : function(xhr, ajaxOptions, thrownError) {
				},
				cache : false,
				contentType : false,
				processData : false
			});
		}

		function GetGEList() {
			$.ajax({
				url : "GECourseList",
				type : 'GET',
				success : function(response) {
					$('#ge_course').html(response);
					$('.selectpicker').selectpicker('refresh');
				},
				error : function(xhr, ajaxOptions, thrownError) {
				},
				cache : false,
				contentType : false,
				processData : false
			});
		}
	</script>
	
	<script>
		
	</script>
	
	<script>
		$("form#data").submit(function(){
			var formData = new FormData(this);
			$.ajax({
			url: "AssignTA",
			type: 'POST',
			data: formData,
			contentType: false,
            cache: false,
            processData:false,
			success: function (response)
			{
				var answer = response;
					switch ( answer )
					{
						case 'success' :
							swal("Done!", "Add Succeed", "success");
								break;
						case 'fail' :
							swal("Assign Failed!", "Please check your internet connection!", "error");
								break;
						case 'crashed' :
							swal("Assign Failed!", "Time crashed!!", "error");
								break;
						case 'wrong' :
							swal("Assign Failed!", "You can not assign this course!", "error");
								break;

					}
					$('#table').bootstrapTable('refresh', {silent: true});
					UpdateList();
	},
	error: function (xhr, ajaxOptions, thrownError)
	{
	},
	cache: false,
	contentType: false,
	processData: false
});

return false;
});
</script>

	<script>
		$("form#data_ge").submit(function(){
			var formData = new FormData(this);
			$.ajax({
			url: "AssignCourse",
			type: 'POST',
			data: formData,
			contentType: false,
            cache: false,
            processData:false,
			success: function (response)
			{
				var answer = response;
					switch ( answer )
					{
						case 'success' :
							swal("Done!", "Add Succeed", "success");
								break;
						case 'fail' :
							swal("Assign Failed!", "Please check your internet connection!", "error");
								break;
						case 'wrong' :
							swal("Assign Failed!", "You can not assign this course!", "error");
								break;

					}
					$('#table').bootstrapTable('refresh', {silent: true});
					UpdateList();
	},
	error: function (xhr, ajaxOptions, thrownError)
	{
	},
	cache: false,
	contentType: false,
	processData: false
});

return false;
});
</script>
</body>

</html>
