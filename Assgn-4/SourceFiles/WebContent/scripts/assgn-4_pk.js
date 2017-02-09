// Name: Prasad Khedekar	G# - G00973357

$(function(){
	$("#submit-button").click(function(){
		formValidate();
		$("#error-dialog").dialog({
			modal: true,
			buttons:{
				OK: function(){
					$(this).dialog("close");
				}
			}
		});
	});
});

function formValidate()
{
	var errString = [];
	var i = 0;
	var nameString = document.getElementById("name").value;
	if (!(/^[a-zA-Z\s]+$/.test(nameString))){
		errString[i] = "Name is required and should contain only Alphabets";
		i++;
		document.getElementById("name").value = "";
	}
	
	var strAddr = document.getElementById("addr").value;
	//var cityAddr = document.getElementById("city").value;
	//var stateAddr = document.getElementById("state").value;
	var zipAddr = document.getElementById("zip").value;
	
	if (!(/^([a-zA-Z0-9\s_-]+)$/.test(strAddr))){
		errString[i] = "Street Address is required and can contain only valid alphanumeric characters";
		i++;
		document.getElementById("addr").value = "";
	}
	/*
	if (!(/^[a-zA-Z\s]+$/.test(cityAddr))){
		errString[i] = "City is required and should contain only Alphabets";
		i++;
		document.getElementById("city").value = "";
	}
	if (!(/^[a-zA-Z\s]+$/.test(stateAddr))){
		errString[i] = "State is required and should contain only Alphabets";
		i++;
		document.getElementById("state").value = "";
	}
	*/
	if (!(/^[0-9]+$/.test(zipAddr))){
		errString[i] = "Zip code is required and should contain only Numbers";
		i++;
		document.getElementById("zip").value = "";
	}
	
	var studentId = document.getElementById("studentid").value;
	if (!(/^[0-9]+$/.test(studentId))){
		errString[i] = "Student Id is required and should contain only Numbers";
		i++;
		document.getElementById("studentid").value = "";
	}
	
	var chkValues = document.getElementsByName("thingsliked");
	var countVal = 0;
	for (var j = 0; j < chkValues.length; j++){
		if (chkValues[j].checked){
			countVal++;
		}
	}
	if (countVal < 2){
		errString[i] = "Check at least 2 check boxes for 'Things liked about campus'";
		i++;
	}
	
	var radValues = document.getElementsByName("interestsource");
	var radChkd = false;
	for (var k = 0; k < radValues.length; k++){
		if (radValues[k].checked){
			radChkd = true;
		}
	}
	if (!radChkd){
		errString[i] = "Select a radio button option for 'Source of Interest in the University'";
		i++;
	}
	
	var emailId = document.getElementById("email").value;
	var emailValid = false;
	var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	emailValid = regex.test(emailId);
	if (!emailValid){
		errString[i] = "Please enter a valid email ID";
		i++;
		document.getElementById("email").value = "";
	}
	
	var inputData = document.getElementById("data").value;
	var inputDataTokens = inputData.split(",");
	var numTokens = inputDataTokens.length;
	var valueArray = [];
	var finalArray = [];
	
	for (var i = 0; i < numTokens; i++){
		valueArray[i] = parseFloat(inputDataTokens[i]);
		if (valueArray[i] >= 1 && valueArray[i] <= 100)
		{
			finalArray[i] = valueArray[i];
		}
		else
		{
			errString[i] = "Number should be between 1 and 100 (inclusive)";
			i++;
		}
	}
	if (finalArray.length < 10)
	{
		errString[i] = "Please enter at least 10 comma-separated numbers in data field";
		i++;
	}
	
	var errNum = errString.length;
	var errAlert = "";
	if (errNum > 0){
		for (var l = 0; l < errNum; l++){
			errAlert = errAlert + errString[l] + "<br />";
		}
		document.getElementById("error-dialog").innerHTML = errAlert;
	}
	else document.getElementById("error-dialog").innerHTML = "Form submitted successfully";
}

function validateZip(zip)
{
	var webUrl = "zipcodes.json";
	
	try
	{
		asyncRequest = new XMLHttpRequest();	// Create request object
		
		// Register event handler
		asyncRequest.onreadystatechange = function()
		{
			showCityState(zip);
		};
		asyncRequest.open('GET', webUrl, true);		// Prepare the request
		asyncRequest.send();					// Send the request
	}
	catch (exception)
	{
		document.getElementById("error-dialog").innerHTML = "Request Failed";
	}
}

function showCityState(zip)
{
	var validZip = false;
	
	if (asyncRequest.readyState == 4 && asyncRequest.status == 200)
	{
		var jsonString = asyncRequest.responseText;
		var data = JSON.parse(jsonString);
		for (var i = 0; i < data.zipcodes.length; i++){
			if (data.zipcodes[i].zip == zip){
				document.getElementById("city").value = data.zipcodes[i].city;
				document.getElementById("state").value = data.zipcodes[i].state;
				document.getElementById("validzip").innerHTML = "";
				validZip = true;
			}
		}
		if (!validZip){
			document.getElementById("city").value = "";				// Clear on invalid Zip
			document.getElementById("state").value = "";
			document.getElementById("validzip").innerHTML = "Please enter a valid Zip";
		}
	}
}