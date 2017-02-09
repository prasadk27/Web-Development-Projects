// Name: Prasad Khedekar  G# - G00973357

package swe642.assgn4.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import swe642.assgn4.jdbc.beans.*;
import swe642.assgn4.jdbc.dao.*;
import swe642.assgn4.jdbc.db.*;

public class StudentMainController {
	
	private String studentid;
	private StudentBean student;
	private DataBean data;
	
	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public StudentBean getStudent() {
		return student;
	}

	public void setStudent(StudentBean student) {
		this.student = student;
	}
	
	public DataBean getData() {
		return data;
	}

	public void setData(DataBean data) {
		this.data = data;
	}

	public String getFromDb(){

		String str = studentid;
		int id = 0;
		if (str != null){
			id = Integer.parseInt(str);
		} else {
			id = 0;
		}

		String address;

		if(id == 0)
		{
			address = "nostudent";	
		}

		StudentDao sd = new StudentDao();

		student = sd.findStudent(id);

		if(student == null)
		{
			address = "nostudent";
		}

		else
		{
			address = "success";
		}

		return address;
	}
	
	public String execute() {
		/*
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
		*/
		
		StudentDao sd = new StudentDao();
		sd.insertStudent(student);
		
		data = DataProcessor.compute(student.getStudData());
		
	    double mean = data.getMean();

	    String address;
		if(mean >= 90){
			address = "winner";
		}
	    else{
	    	address = "simple";
	    }
	    return address;
	}
}
