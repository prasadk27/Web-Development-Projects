<%--
Name: Prasad Khedekar G# - G00973357
 --%>

<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
    <%@ page import="java.sql.*" %>
    <%@ page import="swe642.assgn4.jdbc.beans.*" %>
    <%@ page import="swe642.assgn4.jdbc.dao.*" %>
    <%@ page import="swe642.assgn4.controller.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Simple Acknowledgement</title>
<style type = "text/css">
	table, td {
		border: 1px solid black;
    	border-collapse: collapse;
	}
	td {padding: 10px}
	h1 {
			text-shadow: -4px 4px 6px;
			color: blue
		}
	.special {font-weight: bold}
	#logo {
	 	position: fixed;
	    bottom: 0px;
	    right: 0px;
	    z-index: 1;
	    padding: 0px;
	    margin: 0px;
		 }
	body {
		background-color:#D3D3D3
	}
</style>
</head>
<body>
	<h1>Thank You for filling out the Student Survey Form. Your information has been successfully saved to the database.</h1>
	
	<%

	Class.forName ("oracle.jdbc.driver.OracleDriver");
			
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@apollo.vse.gmu.edu:1521:ite10g", "pkhedeka", "eedroa");
			 
	Statement stmt = con.createStatement();
			
	ResultSet rs = stmt.executeQuery("Select s.studId from Student s"); 		

	%>
	
	<h4> Mean: ${data.mean} </h4>
	<h4> Standard Deviation: ${data.stdDev}</h4>

	<h1>Students already entered in the database are as below:</h1>
	<ul>
		<%
			while (rs.next()) {

				String sid = rs.getString("studId");
		%>

		<li><s:url action="getFromDb" var="urlTag">
				<s:param name="studentid"><%=sid%></s:param>
			</s:url> <a href="<s:property value="#urlTag" />"><%=sid%></a></li>

		<%
			}
		%>
	</ul>
</body>
</html>