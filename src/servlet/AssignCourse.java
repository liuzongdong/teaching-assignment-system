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

/**
 * Servlet implementation class AssignCourse
 */
@WebServlet("/AssignCourse")
@MultipartConfig
public class AssignCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String teacher_id = request.getParameter("teacher");
		String course_id = request.getParameter("course");
		Course course = new Course();
		course.InitCourse(Integer.parseInt(course_id));
		if (Course.HasThisDuplicateCourse(Integer.parseInt(course_id), Integer.parseInt(teacher_id))) 
		{
			course.SetCourseTeacherWorkLoad(0.5);
		}
		else
		{
			course.SetCourseTeacherWorkLoad(1.0);
		}
		if (course.AssginCourse(Integer.parseInt(teacher_id)))
		{
			if (course.AddTeacherWorkLoad(Integer.parseInt(teacher_id))) 
			{
				out.append("success");
			}
			else
			{
				out.append("fail");
			}
		}
		else 
		{
			out.append("fail");
		}
		
		
	}

}
