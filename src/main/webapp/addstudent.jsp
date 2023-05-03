<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>New Student Entry</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
	<link href="https://fonts.googleapis.com/css?family=Play:400,700" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/owl.theme.css">
	<link rel="stylesheet" href="css/owl.transitions.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/morrisjs/morris.css">
	<link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
	<link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
	<link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
	<link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css">
	<link rel="stylesheet" href="css/form/all-type-forms.css">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="css/responsive.css">
	<script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body style="margin:0;padding:0;">
<div style="width:750px;margin:0 auto;">
	<div class="error-pagewrap">
		<div class="error-page-int">
			<div class="content-error">
				<div class="hpanel">
					<div class="panel-body">
						<div class="form-group">
							<form id="form" action="addStudent.do" method="post">
								<fieldset class="step">
									<legend>New Student Entry</legend>
									<div class="form-group">
										<input id="studentid" type="text" name="studentid" placeholder="Student ID" onblur="checkStudentid();" />
									</div>
									<div class="form-group">
										<input id="name" type="text" name="name" placeholder="Student Name">
									</div>
									<div class="form-group">
										<input id="password" type="password" name="password" placeholder="Password" >
									</div>
									<div class="form-group">
										<input type="submit" name="submit" value="Add" class="btn btn-primary btn-block" />
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/jquery-price-slider.js"></script>
<script src="js/jquery.meanmenu.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/scrollbar/mCustomScrollbar-active.js"></script>
<script src="js/metisMenu/metisMenu.min.js"></script>
<script src="js/metisMenu/metisMenu-active.js"></script>
<script src="js/tab.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/icheck/icheck-active.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>
</html>
<script>
	var xmlHttp;
	function createXMLHttp(){
		//1. Create object
		if(window.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}else{
			xmlHttp=new ActivexObject("Microsoft.XMLHTTP");
		}
	}

	//Use AJAX technology to check if the username already exists after entering the student ID
	function checkStudentid(){
		createXMLHttp();
		//2. Set parameters
		var userName=document.getElementById("studentid").value;
		xmlHttp.open("get","CheckStudentid.do?studentid="+userName);
		xmlHttp.onreadystatechange=callBack;

		//3. Send asynchronous request
		xmlHttp.send(null);

	}

	//Callback function
	function callBack(){
		if(xmlHttp.readyState==4){  //Server data returned successfully
			if(xmlHttp.status==200){  //Operation normal
				var text=xmlHttp.responseText;
				/*
					Perform other processing based on the response
				*/
				if(text=='y'){
					document.getElementById("userNameHint").innerHTML="&lt;font color='green'>YES&lt;/font>";

				}
				else{
					document.getElementById("userNameHint").innerHTML="&lt;font color='red'>This student ID already exists&lt;/font>";
				}

			}
		}
	}
</script>
