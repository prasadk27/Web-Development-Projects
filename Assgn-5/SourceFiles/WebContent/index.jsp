<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CS Department Survey</title>
<link rel = "stylesheet" href = "./css/jquery-ui.css" type = "text/css"/>
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
<script src = "./scripts/jquery.js" type="text/javascript"></script>
<script src = "./scripts/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript" src = "./scripts/assgn-4_pk.js"></script>
<script>
$(function(){
	$("#logo").tooltip();
});
</script>
</head>
<body>
<h1>CS Department Survey Form</h1>
<a href="https://www2.gmu.edu/">
<img src="images/logo.svg" alt="logo" height="100" width="150" id="logo" title = "Please visit https://www.gmu.edu for more information."/> 
</a>
<p><strong>Please provide feedback about your campus visit using the survey form below. Required fields are in bold.</strong></p>
<s:form action="register" autocomplete="on" onsubmit = "return formValidate()" theme="simple">
	<table>
		<tbody>
			<tr>
				<td><span class = "special">Name</span><br />
					<s:textfield id = "student.studName" name = "student.studName"/>
				</td>
				<td><span class = "special">Street Address</span><br />
					<s:textfield id = "student.studAddr" name = "student.studAddr"/>
				</td>
				<td><span class = "special">City</span><br />
					<s:textfield id = "student.studCity" name = "student.studCity"/>
				</td>
			</tr>
			<tr>
				<td><span class = "special">State</span><br />
					<s:textfield id = "student.studState" name = "student.studState"/>
				</td>
				<td><span class = "special">Zip</span><br />
					<s:textfield id = "student.studZip" name = "student.studZip" type = "number" onblur = "validateZip(this.value)"/><br />
					<span id = "validzip"></span>
				</td>
				<td><span class = "special">Telephone number</span><br />
					<s:textfield id = "student.studTel" name = "student.studTel"/>
				</td>
			</tr>
			<tr>
				<td><span class = "special">Email</span><br />
					<s:textfield id = "student.studEmail" name = "student.studEmail"/>
				</td>
				<td><span>URL</span><br />
					<s:textfield id = "student.studUrl" name = "student.studUrl"/>
				</td>
				<td><span class = "special">Date of Survey</span><br />
					<s:date id = "student.studDate" name = "student.studDate" var="formattedVal" format="YYYY-MM-DD"/>
					<s:textfield name="student.studDate" placeholder="YYYY-MM-DD" value="%{#formattedVal}" key="labelkey" />
				</td>
			</tr>
			<tr>
				<td><span class = "special">Things liked about Campus</span><br />
					<label>Students<input name = "student.studLiked" type = "checkbox"
							value = "Students"/></label><br />
					<label>Location<input name = "student.studLiked" type = "checkbox"
							value = "Location"/></label><br />
					<label>Campus<input name = "student.studLiked" type = "checkbox"
							value = "Campus"/></label><br />
					<label>Atmosphere<input name = "student.studLiked" type = "checkbox"
							value = "Atmosphere"/></label><br />
					<label>Dorm Rooms<input name = "student.studLiked" type = "checkbox"
							value = "Dorm"/></label><br />
					<label>Sports<input name = "student.studLiked" type = "checkbox"
							value = "Sports"/></label>
				</td>
				<td><span class = "special">Source of Interest in the University</span><br />
					<label>Friends<input name = "student.studInterest" type = "radio"
							value = "Friends"/></label><br />
					<label>Television<input name = "student.studInterest" type = "radio"
							value = "Television"/></label><br />
					<label>Internet<input name = "student.studInterest" type = "radio"
							value = "Internet"/></label><br />
					<label>Other<input name = "student.studInterest" type = "radio"
							value = "Other"/></label>
				</td>
				<td><span class = "special">High-School Graduation Date</span><br />
					<label class = "special">Month
						<s:select
							list="#{'1':'January', '2':'February', '3':'March', '4':'April', '5':'May', '6':'June', 
									'7':'July', '8':'August', '9':'September', '10':'October', '11':'November', '12':'December'}"
							id="student.gradMonth" name = "student.gradMonth" />
					</label>
					<label class = "special">Year
						<s:textfield type = "number" id = "student.gradYear" name = "student.gradYear"/>
					</label>
				</td>				
			</tr>
			<tr>
				<td><span>Comments</span><br />
					<s:textarea id = "student.comments" name = "student.comments"
						rows = "5" cols = "30"/>
				</td>
				<td><span>Would you recommend this school to other prospective students?</span><br />
					<select id = "student.studReco" name = "student.studReco">
						<option value="Very Likely" selected = "selected">Very Likely</option>
						<option value="Likely">Likely</option>
						<option value="Unlikely">Unlikely</option>				
					</select>
				</td>
				<td><span class = "special">Data</span><br />
					<s:textfield id = "student.studData" name = "student.studData"/>
				</td>
			</tr>
			<tr>
				<td><span class = "special">Student ID</span><br />
					<s:textfield id = "student.studId" name = "student.studId" type = "number"/>
				</td>
			</tr>				
		</tbody>
	</table>
	<p>
		<s:submit id = "submit-button" type = "submit" value = "Submit"/>
		<button type = "reset">Reset</button>
	</p>

</s:form>
<div id = "error-dialog" title = "Form Feedback" style = "display:none">
</div>
</body>
</html>