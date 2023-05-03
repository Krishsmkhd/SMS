<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="model.bean.studentinfo"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>Student Information View</title><link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
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
    ArrayList<studentinfo> list=(ArrayList<studentinfo>)request.getAttribute("queryResult");
%>
<body style="margin:0;padding:0;">
<div class="error-pagewrap">
    <div class="error-page-int">
        <div class="content-error">
            <div class="hpanel">
                <div class="panel-body">
                    <div class="form-group">
                        <fieldset class="step">
                            <legend>Personal Modification</legend>
                            <table width="95%" style="text-align:center">
                                <tr>
                                    <td width="70">Student ID</td>
                                    <td width="70">Name</td>
                                    <td width="70">Gender</td>
                                    <td width="100">Birthdate</td>
                                    <td width="150">Hobby</td>
                                </tr>
                                <%
                                    for(int i=0;i<list.size();i++)
                                    {
                                %>
                                <tr>
                                    <td><%=list.get(i).getStudentId()%></td>
                                    <td><%=list.get(i).getStudentName()%></td>
                                    <td><%=list.get(i).getGender()%></td>
                                    <td><%=list.get(i).getBirth()%></td>
                                    <td><%=list.get(i).getFavorite()%></td>
                                    <a href="personinfoset.do?id=<%=list.get(i).getStudentId()%>">View</a>
                                    <a href="javascript:deleteAStudent('<%=list.get(i).getStudentId()%>')">Delete</a>&nbsp;
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </table>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script language="javascript">
    function deleteAStudent(studentId) {
        if (confirm("Are you sure you want to delete this record?")) {
            alert(studentId + " will be deleted!");
            window.location = "delete.do?id='" + studentId + "'";
            // Perform delete operation
        }
    }
</script>
