<%
    session = request.getSession(false);
    if(session.getAttribute("pd") == null)
    {
        response.sendRedirect("login.jsp");
    }

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%!String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/tas";%>
<%!String user = "root";%>
<%!String psw = "";%>
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
				<h3 class="page-header">Course Assignment</h3>

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
							<select data-live-search="true" data-width="100%" class="selectpicker" data-size="6" name="course">
							<%
								Connection con = null;
								PreparedStatement ps = null;
								try
								{
									Class.forName(driverName);
									con = DriverManager.getConnection(url,user,psw);
									String sql = "SELECT * FROM course WHERE course_category = 'MC'";
									ps = con.prepareStatement(sql);
									ResultSet rs = ps.executeQuery();
									while(rs.next())
									{
										String course_name = rs.getString("course_name");
										int course_id = rs.getInt("course_id");
							%>
								<option value="<%=course_id %>"><%=course_name %></option>
							<%
									}
							%>
							<%
								}
									catch(SQLException sqe)
								{
								out.println(sqe);
								}
							%>
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select data-live-search="true" data-width="100%" class="selectpicker" data-size="6" name="teacher">
								<%
								try
								{
									Class.forName(driverName);
									con = DriverManager.getConnection(url,user,psw);
									String sql = "SELECT * FROM teacher";
									ps = con.prepareStatement(sql);
									ResultSet rs = ps.executeQuery();
									while(rs.next())
									{
										String teacher_name = rs.getString("teacher_name");
										int teacher_id = rs.getInt("teacher_id");
							%>
								<option value="<%=teacher_id %>"><%=teacher_name %></option>
							<%
									}
							%>
							<%
								}
									catch(SQLException sqe)
								{
								out.println(sqe);
								}
							%>
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
							<%

								try
								{
									Class.forName(driverName);
									con = DriverManager.getConnection(url,user,psw);
									String sql = "SELECT * FROM course WHERE course_category = 'GE'";
									ps = con.prepareStatement(sql);
									ResultSet rs = ps.executeQuery();
									while(rs.next())
									{
										String course_name = rs.getString("course_name");
										int course_id = rs.getInt("course_id");
							%>
								<option value="<%=course_id %>"><%=course_name %></option>
							<%
									}
							%>
							<%
								}
									catch(SQLException e)
								{
								out.println(e);
								}
							%>
							</select>
						</div>
						<div class="form-group">
							<label>Please Choose Teacher:</label>
							<select data-live-search="true" data-width="100%" class="selectpicker" data-size="6"name="teacher">
								<option value="1">Amy</option>
								<option value="2">Gigi</option>
								<option value="3">HP</option>
								<option value="4">Weifeng</option>
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
	},
	error: function (xhr, ajaxOptions, thrownError)
	{
		swal("Add Failed!", "Please check your internet connection!", "error");
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
