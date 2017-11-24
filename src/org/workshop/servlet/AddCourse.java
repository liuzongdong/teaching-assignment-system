package org.workshop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.workshop.core.Course;

@WebServlet("/addcourse")
/**
 * Add MultipartConfig announcement to fit HTML5 form data
 * @author liuzongdong
 *
 */
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
		int course_section = Integer.parseInt(request.getParameter("course_section"));
		String course_name = request.getParameter("course_name");
		String course_category = request.getParameter("course_category");
		String course_student = request.getParameter("course_student");
		if (course_section == 1) 
		{
			Course course = new Course();
			course.SetCourseName(course_name);
			course.SetCourseCategory(course_category);
			course.SetCourseStudent(course_student);
			boolean status = course.AddCourse();
			if (status) 
			{
				//ReadExcel.ReadExcelFile();
				out.append("success");
			}
			else
			{
				out.append("fail");
			}
		}
		else if (course_section > 1) 
		{
			boolean status = Course.AddSection(course_section, course_name, course_category, course_student);
			if (status) 
			{
				//ReadExcel.ReadExcelFile();
				out.append("success");
			}
			else
			{
				out.append("fail");
			}
		}



	}

}
