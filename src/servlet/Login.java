package servlet;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import course.assign.LoginBean;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() 
    {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String returnPage = "index.jsp";
        LoginBean bean = new LoginBean();  
        bean.setUsername(username);
        bean.setPassword(password);
        boolean status = bean.validate();
        if (status) 
        {
        	HttpSession session = request.getSession();
        	session.setAttribute("pd", true);
            session.setAttribute("username", bean.getUsername());
        	returnPage = "index.jsp";
		}
        else
        {
        	returnPage = "login.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(returnPage);
    	rd.forward(request, response);
	}

}
