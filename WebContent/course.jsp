<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Course</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

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
			<li><a href="index.jsp"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
			<li><a href="addcourse.jsp"><span class="glyphicon glyphicon-th"></span> Add Course</a></li>
			<li><a href="assign.jsp"><span class="glyphicon glyphicon-stats"></span> Assign Course</a></li>
            <li class="active"><a href="course.jsp"><span class="glyphicon glyphicon-tasks"></span> View Course</a></li>
			<li><a href="teacher.jsp"><span class="glyphicon glyphicon-list-alt"></span> Teacher</a></li>
			<li role="presentation" class="divider"></li>
			<li><a href="operation.jsp"><span class="glyphicon glyphicon-edit"></span> Operation </a></li>
		</ul>

	</div><!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Course</li>
			</ol>
		</div><!--/.row-->


		<div style="padding-top:20px;" class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">View Course</div>
					<div class="panel-body">
						<table id="table" data-show-export="true" data-toggle="table" data-url="TestJson"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true"  data-sort-order="desc">
						    <thead>
						    <tr>
								<th data-visible="false"data-field="course_id" data-halign="center" data-align="center" data-sortable="true">Course ID</th>
						        <th data-field="course_name" data-halign="center" data-align="center" data-falign="center" data-valign="middle" data-sortable="true">Name</th>
						        <th data-field="course_category"  data-halign="center" data-align="center"data-falign="center" data-valign="middle" data-sortable="true">Category</th>
						        <th data-field="teacher_name"  data-halign="center" data-align="center" data-falign="center" data-valign="middle"  data-sortable="true">Instructor</th>
						        <th data-field="course_student" data-halign="center" data-align="center" data-falign="center" data-valign="middle"  data-sortable="true">Student</th>
						     	<th data-field="course_time" data-halign="center" data-align="center" data-falign="center" data-valign="middle"  data-sortable="true">Time</th>
						     	<th data-field="course_ta" data-halign="center" data-align="center" data-falign="center" data-valign="middle"  data-sortable="true">TA</th>
						    </tr>
						    </thead>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->

	</div><!--/.main-->

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/bootstrap-table-contextmenu.js"></script>
	<script src="js/bootstrap-table-export.js"></script>
	<script src="js/tableExport.js"></script>
	<script src="js/FileSaver.min.js"></script>
	<script src="js/jspdf.min.js"></script>
	<script src="js/jspdf.plugin.autotable.js"></script>
	<script src="js/xlsx.core.min.js"></script>
	<script>
	$('#table').bootstrapTable({
	    contextMenu: '#context-menu',
	    onContextMenuItem: function(row, $el)
	    {
	        if($el.data("item") == "edit")
	        {
	            alert("Edit: " + row.course_id + ' ' + row.course_name + ' ' + row.course_category);
	        }
	        else if($el.data("item") == "delete")
	        {
	            alert("Delete: " + row.course_id + ' ' + row.course_name + ' ' + row.course_category);
	        }
	    }
	});
	</script>
</body>

</html>
