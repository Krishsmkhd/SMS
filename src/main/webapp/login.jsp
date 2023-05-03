<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>University Information Portal</title>
	<title>Login</title>
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
	<script src="js/jquery-1.12.3.js" type="text/javascript"></script>
	<script src="js/loginjs.js" type="text/javascript" charset=utf-8></script>
</head>
	<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<body>
<div class="error-pagewrap">
	<div class="error-page-int">
		<div class="text-center m-b-md custom-login">
			<h3>Welcome to Student Management System</h3>
		</div>
		<div class="content-error">
			<div class="hpanel">
				<div class="panel-body">
					<form id="form" action="<%=basePath%>servlet/login.do" method="post" onsubmit="return oauthLogon ()">
						<div class="form-group">
							<input id="user_name" type="text" name="username" class="form-control" onFocus="focusUserName()"
								   onBlur="checkUserName()" onKeyDown="enterPassword(event)" onMouseOver="changeBorderColor(this)"
								   onMouseOut="backBorderColor(this)" placeholder="Student ID/Employee ID" />
							<span id="userNameHint"></span>
						</div>
						<div class="form-group">
							<input id="password" type="password" name="password" class="form-control" onFocus="focusPassword()"
								   onBlur="leavePassword()" onKeyDown="enterCode(event)" onMouseOver="changeBorderColor(this)"
								   onMouseOut="backBorderColor(this)" placeholder="Password" />
						</div>
						<div class="form-group">
							<input name="code" id="code" placeholder="Code" type="text" size="8" onFocus="focusCode()"
								   onMouseOver="changeBorderColor(this)" onMouseOut="backBorderColor(this)" class="form-control" />
							<a href="javascript:changeCode();" title="Click to change">
								<img border="0" id="codeimg" src="<%=basePath%>/servlet/ValidateCode.do" />
							</a>
						</div>
						<div class="form-group form-check">
							<input type="checkbox" id="remember_check" name="remember_check" class="form-check-input" />
							<label class="form-check-label" for="remember_check">Remember Me</label>
						</div>
						<div class="form-group">
							<label id="RadioButtonList" for="RadioButtonList">User Type:</label>
							<div class="form-check form-check-inline">
								<input id="RadioButtonListT" type="radio" name="RadioButtonList" value="Teacher" tabindex="4"
									   checked="checked" class="form-check-input">
								<label class="form-check-label" for="RadioButtonListT">Teacher</label>
							</div>
							<div class="form-check form-check-inline">
								<input id="RadioButtonListS" type="radio" name="RadioButtonList" value="Student" tabindex="4"
									   class="form-check-input">
								<label class="form-check-label" for="RadioButtonListS">Student</label>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" name="submit" value="Login" class="btn btn-primary btn-block" />
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="text-center login-footer">
			<p>Copyright ? 2023. All rights reserved. Krish Simkhada</p>
		</div>
	</div>
</div>
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
</body>

</html>
<script>
	function changeCode() {
		var timenow = new Date().getTime();
		document.getElementById("codeimg").src = "&lt;%=basePath%>/servlet/ValidateCode.do?v=" + timenow;
	}

	window.onload = function () {
		var oForm = document.getElementById('form');
		var oUser = document.getElementsByName('username')[0];
		var oFlag = document.getElementsByName('remember_check')[0];

		oForm.onsubmit = function () {
			if (oFlag.checked) {
				setCookie('user', oUser.value, 14);
			}
		}
		oUser.value = getCookie('user');
	}

	function setCookie(name, value, iDay) {
		var oDate = new Date();
		oDate.setDate(oDate.getDate() + iDay);

		document.cookie = name + '=' + value + ';expires=' + oDate;
	}

	function getCookie(name) {
		var arr = document.cookie.split(';');
		for (var i = 0; i&lt;arr.length; i++) {
			var arr2 = arr[i].split('=');
			if (arr2[0] == name) {
				return arr2[1];
			}
		}
		return '';
	}

	var xmlHttp;
	function createXMLHttp() {
		// 1. Create XMLHttpRequest object
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		// Use AJAX technology to check if a user already exists after entering the username
		function checkUserName() {
			// Create XMLHttp object
			createXMLHttp();

			// 2. Set relevant parameters
			var userName = document.getElementById("user_name").value;
			xmlHttp.open("get", "CheckUserName.do?userName=" + userName);
			xmlHttp.onreadystatechange = callBack;

			// 3. Send asynchronous request
			xmlHttp.send(null);
		}

		// Callback function
		function callBack() {
			if (xmlHttp.readyState == 4) { // Server data returned completely
				if (xmlHttp.status == 200) { // Operation is normal
					var text = xmlHttp.responseText;
					/*
                                  Perform other processing based on response
                              */
					if (text == 'y') {
						document.getElementById("userNameHint").innerHTML = "&lt;font color='green'>YES&lt;/font>";
					} else {
						document.getElementById("userNameHint").innerHTML = "&lt;font color='red'>NO&lt;/font>";
					}
				}
			}
		}
	}
</script>

