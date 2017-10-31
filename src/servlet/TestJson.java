package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.JsonArray;

import course.assign.Course;

@WebServlet("/TestJson")
public class TestJson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestJson() 
    {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Course course = new Course();
		JsonArray array = course.ViewCourse();
		out = response.getWriter();
		out.println(array);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
