// Name: Prasad Khedekar  G# - G00973357

package swe642.assgn4.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import swe642.assgn4.jdbc.beans.*;
import swe642.assgn4.jdbc.dao.*;
import swe642.assgn4.jdbc.db.*;

@WebServlet(urlPatterns = {"/StudentMainController"})
public class StudentMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentMainController(){
		super();
	}

	@Override
	protected void doGet (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String str = request.getParameter("studentid");
		int id = 0;
		if (str != null){
			id = Integer.parseInt(str);
		} else {
			id = 0;
		}

		String address;

		if(id == 0)
		{
			address = "NoSuchStudentJSP.jsp";	
		}

		StudentDao sd = new StudentDao();

		StudentBean sb; 

		sb = sd.findStudent(id);

		if(sb == null)
		{
			address = "NoSuchStudentJSP.jsp";
		}

		else
		{
			address = "StudentJSP.jsp";

			HttpSession s = request.getSession(true);

			s.setAttribute("StudentBean",sb);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(address); 

		dispatcher.forward(request, response);

	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentBean student = new StudentBean();
		student.setStudId(Integer.parseInt(request.getParameter("studentid")));
		student.setStudName(request.getParameter("name"));
		student.setStudAddr(request.getParameter("addr"));
		student.setStudCity(request.getParameter("city"));
		student.setStudState(request.getParameter("state"));
		student.setStudZip(Integer.parseInt(request.getParameter("zip")));
		student.setStudTel(request.getParameter("telenumber"));
		student.setStudEmail(request.getParameter("email"));
		student.setStudUrl(request.getParameter("url"));
		student.setStudDate(request.getParameter("surveydate"));
		String tempstring = "";	
		String[] values = request.getParameterValues("thingsliked");
		
		for(int k=0; k<=values.length-1; k++)
		{	
			if(k == values.length-1)
				tempstring += values[k];	
			else
			{
				tempstring	 += values[k]+",";
			}
		}
		
		student.setStudLiked(tempstring);
		student.setStudInterest(request.getParameter("interestsource"));
		student.setGradMonth(request.getParameter("gradmonth"));
		student.setGradYear(Integer.parseInt(request.getParameter("gradyear")));
		student.setComments(request.getParameter("comments"));
		student.setStudReco(request.getParameter("rating"));
		student.setStudData(request.getParameter("data"));
		
		StudentDao sd = new StudentDao();
		sd.insertStudent(student);
		
		DataBean db = DataProcessor.compute(request.getParameter("data"));
		
		HttpSession s = request.getSession (true);
	    s.setAttribute("DataBean", db);
	    
	    double mean = db.getMean();

	    String address;
		if(mean >= 90)
	    	address = "WinnerAcknowledgementJSP.jsp";
	    else
	    	address = "SimpleAcknowledgementJSP.jsp";

	    RequestDispatcher dispatcher = request.getRequestDispatcher(address); 

	    dispatcher.forward(request, response);
	}
}
