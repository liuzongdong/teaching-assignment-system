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
import org.workshop.core.Teacher;

/**
 * Servlet implementation class AssignTA
 */
@WebServlet("/AssignTA")
@MultipartConfig
public class AssignTA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignTA() {
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
		String name = "";
		String result = "";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String ta_id[] = request.getParameterValues("teacher");
		String course_id = request.getParameter("course");
		String day = request.getParameter("day");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String PlainTime = day + " " + from + " - " + to;
		if (day.equals("Monday")) 
		{
			day = "1";
		}
		else if (day.equals("Tuesday")) 
		{
			day = "2";
		}
		else if (day.equals("Wednesday")) 
		{
			day = "3";
		}
		else if (day.equals("Thursday")) 
		{
			day = "4";
		}
		else if (day.equals("Friday")) 
		{
			day = "5";
		}
		String CodedTimeFrom = from.replaceAll("[:]", "");
		String CodedTimeTo = to.replaceAll("[:]", "");
//		for (int i = 0; i < ta_id.length; i++)
//		{
//			System.out.println(Teacher.CheckTimeCrash(ta_id[i], day, CodedTimeFrom, CodedTimeTo));
//		}
		boolean checkCrash = false;
		for (int i = 0; i < ta_id.length; i++)
		{
			if (Teacher.CheckTimeCrash(ta_id[i], day, CodedTimeFrom, CodedTimeTo)) 
			{
				checkCrash = true;
			}
		}
		if (!checkCrash) 
		{
			for (int i = 0; i < ta_id.length; i++)
			{
				name = name + Teacher.GetTAName(ta_id[i]) + " ";
				if (Teacher.AssignTACourse(course_id, ta_id[i], PlainTime, day, CodedTimeFrom, CodedTimeTo)) 
				{
					if (Course.AddTAWorkLoad(ta_id[i]) && Course.SetHasTA(course_id)) 
					{
						result = "success";
					}
				}
				else
				{
					result = "fail";
				}
			}
		}
		else
		{
			result = "crashed";
		}
		if (Course.UpdateTA(course_id, PlainTime, name)) 
		{
			out.append(result);
		}
		else
		{
			out.append("fail");
		}
	}
}
