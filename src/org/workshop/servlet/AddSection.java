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
 * Servlet implementation class AddSection
 */

@WebServlet("/AddSection")
@MultipartConfig
public class AddSection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSection() {
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
		String course_number = request.getParameter("add_course_number");
		String course_id = request.getParameter("add_course_id");
		String course_name = request.getParameter("add_course_name");
        String course_category = request.getParameter("add_course_category");
        String course_student = request.getParameter("add_course_student");
        //Status = false;
        if (Course.AddSection(Integer.parseInt(course_number), course_name, course_category, course_student)) 
        {
			if (Course.DeleteCourse(Integer.parseInt(course_id))) 
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
