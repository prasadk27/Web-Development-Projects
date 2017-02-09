<%--
Name: Prasad Khedekar G# - G00973357
 --%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    <%@ page import="swe642.assgn4.jdbc.beans.*" %>
    <%@ page import="swe642.assgn4.jdbc.dao.*" %>
    <%@ page import="swe642.assgn4.controller.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information</title>
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
	<form>
		<fieldset disabled>
			<table>
		<tbody>
			<tr>
				<td><span class = "special">Name</span><br />
					<textarea id = "name" name = "name" rows = "1" cols = "30">${StudentBean.studName}</textarea>
				</td>
				<td><span class = "special">Street Address</span><br />
					<textarea id = "addr" name = "addr" rows = "1" cols = "30">${StudentBean.studAddr}</textarea>
				</td>
				<td><span class = "special">City</span><br />
					<textarea id = "city" name = "city" rows = "1" cols = "30">${StudentBean.studCity}</textarea>
				</td>
			</tr>
			<tr>
				<td><span class = "special">State</span><br />
					<textarea id = "state" name = "state" rows = "1" cols = "30">${StudentBean.studState}</textarea>
				</td>
				<td><span class = "special">Zip</span><br />
					<textarea id = "zip" name = "zip" rows = "1" cols = "30">${StudentBean.studZip.toString()}</textarea>
				</td>
				<td><span>Telephone number</span><br />
					<textarea id = "telenumber" name = "telenumber" rows = "1" cols = "30">${StudentBean.studTel}</textarea>
				</td>
			</tr>
			<tr>
				<td><span class = "special">Email</span><br />
					<textarea id = "email" name = "email" rows = "1" cols = "30">${StudentBean.studEmail}</textarea>
				</td>
				<td><span>URL</span><br />
					<textarea id = "url" name = "url" rows = "1" cols = "30">${StudentBean.studUrl}</textarea>
				</td>
				<td><span>Date of Survey</span><br />
					<textarea id = "surveydate" name = "surveydate" rows = "1" cols = "30">${StudentBean.studDate}</textarea>
				</td>
			</tr>
			<tr>
				<td><span class = "special">Things liked about Campus</span><br />
					<textarea name = "thingsliked" rows = "1" cols = "30">${StudentBean.studLiked}</textarea>
				</td>
				<td><span class = "special">Source of Interest in the University</span><br />
					<textarea name = "interestsource" rows = "1" cols = "30">${StudentBean.studInterest}</textarea>
				</td>
				<td><span>High-School Graduation Date</span><br />
					<label>Month
						<textarea id = "txtList" name = "gradmonth"
							rows = "1" cols = "30">${StudentBean.gradMonth}</textarea>
					</label>
					<label>Year
						<textarea id = "year" name = "gradyear" rows = "1" cols = "30">${StudentBean.gradYear.toString()}</textarea>
					</label>
				</td>				
			</tr>
			<tr>
				<td><span>Comments</span><br />
					<textarea id = "comments" name = "comments"
						rows = "5" cols = "30">${StudentBean.comments}</textarea>
				</td>
				<td><span>Would you recommend this school to other prospective students?</span><br />
					<textarea id = "rating" name = "rating" rows = "1" cols = "30">${StudentBean.studReco}</textarea>
				</td>
				<td><span>Data</span><br />
					<textarea id = "data" name = "data" rows = "1" cols = "30">${StudentBean.studData}</textarea>
				</td>
			</tr>
			<tr>
				<td><span>Student ID</span><br />
					<textarea id = "studentid" name = "studentid" rows = "1" cols = "30">${StudentBean.studId.toString()}</textarea>
				</td>
			</tr>				
		</tbody>
	</table>
		</fieldset>
	</form>
</body>
</html>