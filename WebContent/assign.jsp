<%
    session = request.getSession(false);
    if(session.getAttribute("pd") == null)
    {
        response.sendRedirect("login.jsp");
    }

%>

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
							<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</ul>
					</li>

				</ul>
			</div>

		</div><!-- /.container-fluid -->
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li><a href="index.jsp"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
			<li><a href="addcourse.jsp"><span class="glyphicon glyphicon-th"></span> Add Course</a></li>
            <li class="active"><a href="assign.jsp"><span class="glyphicon glyphicon-stats"></span> Assign Course</a></li>
            <li><a href="course.jsp"><span class="glyphicon glyphicon-tasks"></span> View Course</a></li>
			<li><a href="teacher.jsp"><span class="glyphicon glyphicon-list-alt"></span> Teacher</a></li>



			<li role="presentation" class="divider"></li>

		</ul>

	</div><!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Assign Course</li>
			</ol>
		</div><!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<pre class="page-header">Course Assignment</pre>
			</div>
		</div><!--/.row-->

		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">MC Course
						<div style="float:right;">
							<div style="float:right">
							<label for="submitForm" class="btn btn-primary"> Submit </label>
						</div>
						</div>
					</div>
					<form id="data" method="post">
					<div class="panel-body">
						<div class="form-group">
							<label>Please Choose Course:</label>
							<select id="mc_course" data-live-search="true" data-width="100%" class="selectpicker" data-size="6" name="course">
							<optgroup id="mc-course" label="Unassigned Course">
							
							</optgroup>
							
							<optgroup id="un-mc-course" label="Assigned Course" disabled>

							</optgroup>
							
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select data-live-search="true" data-width="100%" class="selectpicker" data-size="6" name="teacher">

							</select>
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
							<button class="btn btn-primary" type="button" name="button">Submit</button>
						</div>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label>Please Choose Course:</label>
							<select data-live-search="true" data-width="100%" class="selectpicker" data-size="6" name="course">
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select data-live-search="true" data-width="100%" class="selectpicker" data-size="6"name="teacher">

							</select>
						</div>
					</div>
				</div>
			</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">Workload Table</div>
						<div class="panel-body">
							<table data-toggle="table" data-height="415" data-url="tables/data2.json" >
							    <thead>
							    <tr>
							        <th data-field="id" data-halign="center" data-align="center">Teacher Name</th>
							        <th data-field="name" data-halign="center" data-align="center">WorkLoad</th>
							    </tr>
							    </thead>
							</table>
						</div>
					</div>
				</div>
		</div><!--/.row-->

	</div>	<!--/.main-->


	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/sweetalert.js"></script>
	<script src="js/bootstrap-select.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/bootstrap-table-resizable.js"></script>
	<script src="js/colResizable.js"></script>

	<script>
		window.onload = function() {
			GetMCList();
			setTimeout(function() {
				GetMCUnassignedList();
			}, 50);
		};
	</script>

	<script>
		function GetMCList()
		{
			$.ajax({
				url: "MCCourseList",
				type: 'GET',
				success: function (response)
				{
					$('#mc-course').append(response);
					$('.selectpicker').selectpicker('refresh');
				},
		error: function (xhr, ajaxOptions, thrownError)
		{
			alert("fail");
		},
		cache: false,
		contentType: false,
		processData: false
	});
		}
	</script>
	
	<script>
		function GetMCUnassignedList()
		{
			$.ajax({
				url: "MCUnassignedCourseList",
				type: 'GET',
				success: function (response)
				{
					$('#un-mc-course').append(response);
					$('.selectpicker').selectpicker('refresh');
				},
		error: function (xhr, ajaxOptions, thrownError)
		{
			alert("fail");
		},
		cache: false,
		contentType: false,
		processData: false
	});
		}
	</script>
	
	
	
	<script>
		$("form#data").submit(function(){
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
							swal("Add Failed!", "Please check your internet connection!", "error");
								break;

					}
					$('#table').bootstrapTable('refresh', {silent: true});
					GetMCList();
					setTimeout(function() {
						GetMCUnassignedList();
					}, 50);
	},
	error: function (xhr, ajaxOptions, thrownError)
	{
		alert("fail");
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
