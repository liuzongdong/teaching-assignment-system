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
<title>Add Course</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<link href="css/bootstrap-select.css" rel="stylesheet">
<link href="css/bootstrap-table.css" rel="stylesheet">

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
					<li style="color:white;">
						Admin <a href="#"><span class="glyphicon glyphicon-log-out"></span> </a>
					</li>

				</ul>
			</div>

		</div><!-- /.container-fluid -->
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li><a href="index.jsp"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
			<li class="active"><a href="addcourse.jsp"><span class="glyphicon glyphicon-th"></span> Add Course</a></li>
            <li><a href="assign.jsp"><span class="glyphicon glyphicon-stats"></span> Assign Course</a></li>
            <li><a href="course.jsp"><span class="glyphicon glyphicon-tasks"></span> View Course</a></li>
			<li><a href="tables.jsp"><span class="glyphicon glyphicon-list-alt"></span> Workload</a></li>
			<li><a href="forms.jsp"><span class="glyphicon glyphicon-pencil"></span> View Teacher</a></li>
			<li><a href="panels.jsp"><span class="glyphicon glyphicon-info-sign"></span> Add Teacher</a></li>
			<li role="presentation" class="divider"></li>

		</ul>

	</div><!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Add Course</li>
			</ol>
		</div><!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">Course</h3>
			</div>
		</div><!--/.row-->

		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">Add MC/GE Course
						<div style="float:right">
							<label for="submitForm" class="btn btn-primary"> Submit </label>
							<label for="resetForm" class="btn btn-default"> Reset </label>
						</div>
				</div>
					<div class="panel-body">
						<form id="data"role="form" action="addcourse" method="post">

							<div class="form-group">
								<label>Subject:</label>
								<input required class="form-control" name="course_name" placeholder="Please input Subject">
							</div>

							<div class="form-group">
							<label>Please Choose Category:</label>
							<select data-width="100%" class="selectpicker" name="course_category">
								<option value="MC">MC</option>
								<option value="GE">GE</option>
							</select>
						</div>

							<div class="form-group">
								<label>Students</label>
								<input required class="form-control" name="course_student" placeholder="Please input Student">
							</div>
							<div class="form-group" style="text-align:center">
                    			<button id="submitForm" type="submit" class="btn btn-primary hidden">Submit Button</button>
                    			<button id="resetForm" type="reset" class="btn btn-default hidden">Reset Button</button>
                  			</div>
						</form>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">IT Course
						<div style="float:right">
							<label for="submitITForm" class="btn btn-primary"> Submit </label>
							<label for="resetITForm" class="btn btn-default"> Reset </label>
						</div>
					</div>
					<div class="panel-body">
						<form id="it" role="form" action="" method="post">

							<pre>There are 4 IT Sections.</pre>

							<div class="form-group">
								<label>Number:</label>
								<input required name="it_number" class="form-control" placeholder="Please input Number">
							</div>

							<div class="form-group" style="text-align:center">
                    			<button id="submitITForm" type="submit" class="btn btn-primary hidden">Submit Button</button>
                    			<button id="resetITForm" type="reset" class="btn btn-default hidden">Reset Button</button>
                  			</div>

						</form>
					</div>
				</div>

			</div><!--/.col-->

			<div class="col-md-6">

			<div class="panel panel-default">
					<div class="panel-heading">View Course</div>
					<div class="panel-body">
						<table id="table" data-show-export="true" data-toggle="table" data-url="ViewBasicCourse" data-height="463" data-show-refresh="true" data-show-toggle="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true"  data-sort-order="desc">
						    <thead>
						    <tr>
								<th data-visible="false" data-field="course_id" data-halign="center" data-align="center" data-sortable="true">Course ID</th>
						        <th data-field="course_name" data-halign="center" data-align="center" data-sortable="true">Name</th>
						        <th data-field="course_category"  data-halign="center" data-align="center" data-sortable="true">Category</th>
						        <th data-field="course_student" data-halign="center" data-align="center" data-sortable="true">Student</th>
						    </tr>
						    </thead>
						</table>
					</div>
				</div>
                <ul id="context-menu" class="dropdown-menu">
    			    <li data-item="edit"><a>Edit</a></li>
    			    <li data-item="delete"><a>Delete</a></li>
    			</ul>


			</div><!--/.col-->



		</div><!--/.row-->
		
		  <div class="modal fade" id="EditCourse" role="dialog">
    		<div class="modal-dialog modal-md">
    		<form id="editdata" method="post">
    		<div class="modal-content">
        			<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title">Edit Course</h4>
        			</div>
        		<div class="modal-body">
        		
        		
        			
					<input id="edit_id" required  class="form-control hidden" name="course_id" placeholder="Please input Subject">
        			<div class="form-group">
						<label>Course Name:</label>
						<input id="edit_name" required class="form-control" name="course_name" placeholder="Please input Subject">
					</div>

						<div class="form-group">
							<label>Course Category:</label>
							<select id="edit_category" data-width="100%" class="selectpicker" name="course_category">
								<option value="MC">MC</option>
								<option value="GE">GE</option>
							</select>
						</div>

						<div class="form-group">
							<label>Course Students:</label>
							<input id="edit_student" required class="form-control" name="course_student" placeholder="Please input Student">
						</div>
        		
        			</div>
        		<div class="modal-footer">
        		<button type="submit" class="btn btn-primary"> Update </button>
          		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        		</div>
      		</div>
      		</form>
 
      			
    		</div>
  		</div>

	</div>	<!--/.main-->


	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/sweetalert.js"></script>
	<script src="js/bootstrap-select.js"></script>
	<script src="js/bootstrap-table.js"></script>
	<script src="js/bootstrap-table-contextmenu.js"></script>
	<script src="js/bootstrap-table-export.js"></script>
	<script src="js/tableExport.js"></script>
	<script src="js/FileSaver.min.js"></script>
	<script src="js/jspdf.min.js"></script>
	<script src="js/jspdf.plugin.autotable.js"></script>
	<script src="js/xlsx.core.min.js"></script>
	<script>
		
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
	        if($el.data("item") == "edit")
	        {
	        	$('#edit_id').val(row.course_id);
	        	$('#edit_category').val(row.course_category);
	        	$('#edit_name').val(row.course_name);
	        	$('#edit_student').val(row.course_student);
	        	$('#EditCourse').modal('show');
	        }
	        else if($el.data("item") == "delete")
	        {
                swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover it",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                    })
                    .then((willDelete) => {
                    if (willDelete)
                    {
                    	var data = {
                    		    course_id: row.course_id
                    		};
                    	$.ajax({
                			url: "DeleteCourse",
                			type: 'POST',
                			contentType: "application/json",
                			data: JSON.stringify(data),
                			success: function (response)
                			{
                				var answer = response;
                					switch ( answer )
                					{
                						case 'success' :
                							swal("Done!", "Delete Succeed", "success");
                								break;
                						case 'fail' :
                							swal("Delete Failed!", "Please check your internet connection!", "error");
                								break;

                					}
                					$('#table').bootstrapTable('refresh', {silent: true});
                	},
                	error: function (xhr, ajaxOptions, thrownError)
                	{
                		swal("Delete Failed!", "Please check your internet connection!", "error");
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
		$("form#data").submit(function(){
			var formData = new FormData(this);
			$.ajax({
			url: "addcourse",
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

<script>
		$("form#editdata").submit(function(){
		    var formData = new FormData(this);
			$.ajax({
			url: "EditCourse",
			type: 'POST',
			data: formData,
			success: function (response)
			{
				var answer = response;
					switch ( answer )
					{
						case 'success' :
							swal("Done!", "Edit Succeed", "success");
								break;
						case 'fail' :
							swal("Edit Failed!", "Please check your internet connection!", "error");
								break;
		
					}
					$('#table').bootstrapTable('refresh', {silent: true});
					$('#EditCourse').modal('hide');
		
		},
		error: function (xhr, ajaxOptions, thrownError)
		{
		swal("Add Failed!", "Please check your internet connection!", "error");
		$('#EditCourse').modal('hide');
		
		},
		cache: false,
		contentType: false,
		processData: false
		});
		
		return false;
		});

</script>

	<script>
		$("form#it").submit(function(){
			var formData = new FormData(this);
			$.ajax({
			url: "AddITCourse",
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
							swal("Done!", "Add Succeed", "success")
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
