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
			<li class="active"><a href="addcourse.jsp"><span class="glyphicon glyphicon-th"></span> Add Course</a></li>
            <li><a href="assign.jsp"><span class="glyphicon glyphicon-stats"></span> Assign Course</a></li>
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
				<li class="active">Add Course</li>
			</ol>
		</div><!--/.row-->

		<div style="padding-top:20px;"class="row">
			<div class="col-md-5">
			<div class="panel panel-default">
					<div class="panel-heading">Import From Excel
						<div style="float:right">
							<label for="submitDataForm" class="btn btn-primary"> Import </label>
						</div>
					</div>
					<div class="panel-body">
						<form role="form" id="import" method="post" enctype="multipart/form-data">

							<pre>Download the template Excel file <a href="files/Course.xlsx">here</a></pre>

							<div class="form-group">
								<label>File:</label>
								<input required name="file" type="file" class="filestyle" data-buttonName="btn-primary">
							</div>

							<div class="form-group" style="text-align:center">
                    			<button id="submitDataForm" type="submit" class="btn btn-primary hidden">Submit Button</button>
                    			<button id="resetDataForm" type="reset" class="btn btn-default hidden">Reset Button</button>
                  			</div>

						</form>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Add Course
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
								<label>Section(s):</label> <select data-width="100%"
									class="selectpicker" name="course_section">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
								</select>
							</div>

							<div class="form-group">
							<label>Please Choose Category:</label>
							<select data-width="100%" class="selectpicker" name="course_category">
								<option value="MC">MC</option>
								<option value="GE">GE</option>
								<option value="MC For Others">MC For Others</option>
							</select>
						</div>

							<div class="form-group">
								<label>Students</label>
									<select data-width="100%" class="selectpicker" name="course_student">
										<option value="CST Y1">CST Y1</option>
										<option value="CST Y2">CST Y2</option>
										<option value="CST Y3">CST Y3</option>
										<option value="CST Y4">CST Y4</option>
										<option value="All Students">All Students</option>
									</select>
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
								<input required name="it_number" type="number" min="0" class="form-control" placeholder="Please input Number">
							</div>

							<div class="form-group" style="text-align:center">
                    			<button id="submitITForm" type="submit" class="btn btn-primary hidden">Submit Button</button>
                    			<button id="resetITForm" type="reset" class="btn btn-default hidden">Reset Button</button>
                  			</div>

						</form>
					</div>
				</div>

			</div><!--/.col-->

			<div class="col-md-7">

			<div class="panel panel-default">
					<div class="panel-heading">View Course</div>
					<div class="panel-body">
						<table id="table" data-height="779"data-show-export="true" data-toggle="table" data-url="ViewBasicCourse" data-page-list="[20, 50, 100]" data-page-size="20" data-show-refresh="true" data-show-toggle="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-order="desc">
						    <thead>
						    <tr>
								<th data-visible="false" data-field="course_id" data-halign="center" data-align="center" data-sortable="true">Course ID</th>
						        <th data-field="course_name" data-halign="center" data-align="center" data-sortable="true">Course Name</th>
						        <th data-field="course_category"  data-halign="center" data-align="center" data-falign="center" data-valign="middle" data-sortable="true">Category</th>
						        <th data-field="course_student" data-halign="center" data-align="center" data-falign="center" data-valign="middle" data-sortable="true">Student</th>
						    </tr>
						    </thead>
						</table>
					</div>
				</div>
                <ul id="context-menu" class="dropdown-menu">
    			    <li data-item="edit"><a>Edit</a></li>
    			    <li data-item="delete"><a>Delete</a></li>
    			    <li data-item="duplication"><a>Add Section</a></li>
    			</ul>


			</div><!--/.col-->



		</div><!--/.row-->
		
				  <div class="modal fade" id="AddSection" role="dialog">
    		<div class="modal-dialog modal-md">
    		<form id="adddata" method="post">
    		<div class="modal-content">
        			<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title">Add Section</h4>
        			</div>
        		<div class="modal-body">



					<input id="add_id" required  class="form-control hidden" name="add_course_id">
					
					<div class="form-group">
						<label>Section Number:</label>
						<input id="add_number" required class="form-control" name="add_course_number" placeholder="Please input Section Number">
					</div>
					
        			<div class="form-group">
						<label>Course Name:</label>
						<input readOnly="readonly" id="add_name" required class="form-control" name="add_course_name" placeholder="Please input Subject">
					</div>

						<div class="form-group">
							<label>Course Category:</label>
							<input readOnly="readonly" id="add_category" required class="form-control" name="add_course_category">
						</div>

						<div class="form-group">
							<label>Course Students:</label>
							<input readOnly="readonly" id="add_student" required class="form-control" name="add_course_student">
						</div>

        			</div>
        		<div class="modal-footer">
        		<button type="submit" class="btn btn-primary"> Add </button>
          		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        		</div>
      		</div>
      		</form>


    		</div>
  		</div>

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
								<option value="MC for Others">MC for Others</option>
							</select>
						</div>

						<div class="form-group">
							<label>Course Students:</label>
								<select id="edit_student" data-width="100%" class="selectpicker" name="course_student">
										<option value="CST Y1">CST Y1</option>
										<option value="CST Y2">CST Y2</option>
										<option value="CST Y3">CST Y3</option>
										<option value="CST Y4">CST Y4</option>
										<option value="All Students">All Students</option>
								</select>
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
	<script src="js/bootstrap-filestyle.js"></script>
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
	        		$('#edit_category').val(row.course_category).change();
	        		$('#edit_id').val(row.course_id);
	        		$('#edit_name').val(row.course_name);
	        		$('#edit_student').val(row.course_student).change();
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
	        else if($el.data("item") == "duplication")
	        	{
	        		if(row.course_duplicate == 1)
	        			{
	        				swal("Error!", "You can't add sections for this course.", "error");
	        				return;
	        			}
	        		if(row.course_type == 1)
	        			{
	        				swal("Error!", "You can't add sections for IT course", "error");
	        				return;
	        			}
		        	$('#add_category').val(row.course_category);
	        		$('#add_id').val(row.course_id);
	        		$('#add_name').val(row.course_name);
	        		$('#add_student').val(row.course_student);
	        		$('#AddSection').modal('show');
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
	
		$("form#import").submit(function(){
			var formData = new FormData(this);
			$.ajax({
			url: "ImportData",
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
							swal("Done!", "Import Succeed", "success");
								break;
						case 'fail' :
							swal("Import Failed!", "Please check your Excel file!", "error");
								break;
						case 'wrong' :
							swal("Import Failed!", "Please upload a Excel workbook file!", "error");
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
<script>
$("form#adddata").submit(function(){
    var formData = new FormData(this);
	$.ajax({
	url: "AddSection",
	type: 'POST',
	data: formData,
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
			$('#AddSection').modal('hide');

},
error: function (xhr, ajaxOptions, thrownError)
{
swal("Add Failed!", "Please check your internet connection!", "error");
$('#AddSection').modal('hide');

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
