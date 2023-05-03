<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Search Students</title>    <meta name="description" content="">
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

<body style="margin:0;padding:0;">
<div class="error-pagewrap">
	<div class="error-page-int">
		<div class="content-error">
			<div class="hpanel">
				<div class="panel-body">
					<div class="form-group">
						<form id="form" action="QueryController.do" method="post" onsubmit="return checkForm();">
							<fieldset class="step">
								<legend>Search Students</legend>
								<div class="form-group">
									<input id="studentid" type="text" name="studentid" placeholder="Student ID" >
								</div>
								<div class="form-group">
									<input id="name" type="text" name="name" placeholder="Name" >
								</div>
								<div class="form-group">
									<input type="submit" name="submit" value="Search" class="btn btn-primary btn-block" />
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

<script>
	function checkForm() {
		if (document.getElementById("studentid").value == '' || document.getElementById("name").value == '') {
			alert("Please enter the information to be searched.");
			return false;
		}
		return true;
	}
</script>

</html>
