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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class DeleteCourse
 */
@WebServlet("/DeleteCourse")
@MultipartConfig
public class DeleteCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		JsonObject data = new Gson().fromJson(request.getReader(), JsonObject.class);
		String course_id = data.get("course_id").getAsString();
		if (Course.DeleteCourse(Integer.parseInt(course_id)))
		{
			out.append("success");
		}
		else
		{
			out.append("fail");
		}
	}

}
