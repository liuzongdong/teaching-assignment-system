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
							<label for="submitForm" class="btn btn-default"> Assign </label>
						</div>
						</div>
					</div>
					<form id="data" method="post">
					<div class="panel-body">
						<div class="form-group">
							<label>Please Choose Course:</label>
							<select id="mc_course" data-live-search="true" data-width="100%" class="selectpicker" data-size="10" name="course">
							
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select id="teacher_list" data-live-search="true" data-width="100%" class="selectpicker" data-size="10" name="teacher">

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
							<button class="btn btn-default" type="button" name="button"> Assign </button>
						</div>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label>Please Choose Course:</label>
							<select id="ge_course" data-live-search="true" data-width="100%" class="selectpicker" data-size="10" name="course">
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select id="teacher_list_1" data-live-search="true" data-width="100%" class="selectpicker" data-size="10" name="teacher">

							</select>
						</div>
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
							<select data-live-search="true" data-width="100%" class="selectpicker" data-size="10" name="course">
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select id="teacher_list_2" data-live-search="true" data-width="100%" class="selectpicker dropup" data-size="10"name="teacher">

							</select>
						</div>
					</div>
				</div>
			</div>
				<div class="col-md-7">
					<div class="panel panel-default">
						<div class="panel-heading">Workload Table</div>
						<div class="panel-body">
							<table data-toggle="table" data-height="415" data-url="TestJson" >
							    <thead>
							    <tr>
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

	</div>	<!--/.main-->


	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/sweetalert.js"></script>
	<script src="js/bootstrap-select.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/bootstrap-table-resizable.js"></script>
	<script src="js/colResizable.js"></script>

	<script>
		window.onload = function() 
		{
			UpdateList();
		};
	</script>

	<script>
		
		function UpdateList() {
			GetMCList();
			setTimeout(function() {
				GetGEList();
				setTimeout(function() {
					GetTeacherList();
				}, 10);
			}, 10);
			
		}
		function GetMCList() {
			$.ajax({
				url : "MCCourseList",
				type : 'GET',
				success : function(response) {
					$('#mc_course').html(response);
					$('.selectpicker').selectpicker('refresh');
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert("fail");
				},
				cache : false,
				contentType : false,
				processData : false
			});
		}

		function GetTeacherList() {
			$.ajax({
				url : "TeacherList",
				type : 'GET',
				success : function(response) {
					$('#teacher_list, #teacher_list_1, #teacher_list_2')
							.html(response);

					$('.selectpicker').selectpicker('refresh');
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert("fail");
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
					alert("fail");
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
