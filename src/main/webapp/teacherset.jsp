<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="model.bean.teacher" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Personal Settings</title>
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
<%
  teacher currentUser=(teacher)session.getAttribute("currentUser");
  if(currentUser==null)
	{
		response.sendRedirect("login.jsp");
		return;
	}	
%>
<body style="margin:0;padding:0;">
<div style="width:750px;margin:0 auto;">
    <div class="error-pagewrap">
        <div class="error-page-int">
            <div class="content-error">
                <div class="hpanel">
                    <div class="panel-body">
                        <div class="form-group">
                            <form id="form" action="updatetUser.do?uid=<%=currentUser.getTeacherNum()%>" method="post">
                                <fieldset class="step">
                                    <legend>Personal Settings</legend>
                                    <div class="form-group">

                                        <input id="teachernum" type="text" name="teachernum" value="<%=currentUser.getTeacherNum()%>" readonly/>
                                    </div>
                                    <div class="form-group">
                                        <input id="name" type="text" name="name" value="<%=currentUser.gettName()%>" readonly/>
                                    </div>
                                    <div class="form-group">
                                        <input id="nikname" type="text" name="nikname" value="<%=currentUser.getTnikname()%>"/>
                                    </div>
                                    <div class="form-group">
                                        <input id="email" type="text" name="email" value="<%=currentUser.getTemail()%>"/>
                                    </div>
                                    <div class="form-group">
                                        <input id="password" type="password" name="password" value="<%=currentUser.getTpwd()%>" readonly/>
                                    </div>
                                    <div class="form-group">
                                        <input id="newpassword1" type="password" name="newpassword1" placeholder="New Password">
                                    </div>
                                    <div class="form-group">
                                        <input id="newpassword2" type="password" name="newpassword2" placeholder="Re-enter Password">
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" name="submit" value="Save" class="btn btn-primary btn-block">
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
</html>
<script>
    function checkForm(){
        /*
        */
        if(document.getElementById("nikname").value=='')
        {
            alert("Username cannot be empty~!");
            return false;
        }

        if(document.getElementById("email").value=='')
        {
            alert("Email cannot be empty~!");
            return false;
        }

        if(document.getElementById("newpassword1").value=='')
        {
            alert("New password cannot be empty~!");
            return false;
        }

        if(document.getElementById("newpassword2").value=='')
        {
            alert("Confirm password cannot be empty~!");
            return false;
        }

        if(document.getElementById("newpassword1").value!=document.getElementById("newpassword2").value)
        {
            alert("Confirm password must be the same as password~!");
            return false;
        }

        return true;
    }
</script>
