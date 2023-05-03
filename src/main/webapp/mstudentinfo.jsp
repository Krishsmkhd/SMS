<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="model.bean.studentinfo"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>View Personal Information</title>
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
<%
	studentinfo studenti=(studentinfo)session.getAttribute("studentInfo");
	if(studenti==null)
	{
		response.sendRedirect("login.jsp");
		return;
	}	
%>
<body style="margin:0;padding:0;">
<div style="width:750px;margin:0 auto;font: 12px Arial, Helvetica, sans-serif;">
    <div class="error-pagewrap">
        <div class="error-page-int">
            <div class="content-error">
                <div class="hpanel">
                    <div class="panel-body">
                        <form action="personinfoset.do" method="post">
                            <div class="form-group">
                                <fieldset class="step">
                                    <legend>Personal Information</legend>
                                    <table class="portlet-form-table" width="98%">
                                        <tbody>
                                        <tr>
                                            <th>Student ID</th>
                                            <td>
                                                <%=studenti.getStudentId()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <td>
                                                <%=studenti.getStudentName()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Former Name</th>
                                            <td>
                                                <%=studenti.getOldname()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Gender</th>
                                            <td>
                                                <%=studenti.getGender()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Hobby</th>
                                            <td>
                                                <%=studenti.getStudentsf()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Nationality</th>
                                            <td>
                                                <%=studenti.getNation()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Date of Birth</th>
                                            <td>
                                                <%=studenti.getBirth()%>
                                            </td>
                                            <th>Hometown</th>
                                            <td>
                                                <%=studenti.getFrom()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th> Health Status</th>
                                            <td>
                                                <%=studenti.getHealth() %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Country</th>
                                            <td>
                                                <%=studenti.getContry()%>
                                            </td>
                                            <th>Blood Type</th>
                                            <td>
                                                <%=studenti.getRed()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Residence Before Admission</th>
                                            <td>
                                                <%=studenti.getOcity()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Residence After Admission</th>
                                            <td>
                                                <%=studenti.getNcity()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>School</th>
                                            <td>
                                                <%=studenti.getSchool()%>
                                            </td>
                                            <th>Weight</th>
                                            <td>
                                                <%=studenti.getWeight()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Height</th>
                                            <td>
                                                <%=studenti.getHeight()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Hobby</th>
                                            <td>
                                                <%=studenti.getFavorite()%>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <p style="text-align:center">
                                        <a href="personinfo.jsp">Edit</a>
                                    </p>
                                </fieldset>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

