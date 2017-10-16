package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import course.assign.Course;

@WebServlet("/addcourse")
@MultipartConfig
public class AddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddCourse() 
    {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String course_name = request.getParameter("course_name");
        String course_category = request.getParameter("course_category");
        String course_student = request.getParameter("course_student");
		Course course = new Course();
		course.SetCourseName(course_name);
		course.SetCourseCategory(course_category);
		course.SetCourseStudent(course_student);
		boolean status = course.AddCourse();
		if (status) 
		{
			out.append("success");
		}
		else
		{
			out.append("fail");
		}
		
		
	}

}
