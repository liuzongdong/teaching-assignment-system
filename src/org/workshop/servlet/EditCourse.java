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

/**
 * Servlet implementation class EditCourse
 */
@WebServlet("/EditCourse")
/**
 * Add MultipartConfig announcement to fit HTML5 form data
 * @author liuzongdong
 *
 */
@MultipartConfig
public class EditCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditCourse() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String course_id = request.getParameter("course_id");
		String course_name = request.getParameter("course_name");
		String course_category = request.getParameter("course_category");
		String course_student = request.getParameter("course_student");
		boolean status = Course.EditCourse(Integer.parseInt(course_id), course_name, course_category, course_student);
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
