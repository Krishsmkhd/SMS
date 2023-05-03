<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="model.bean.studentinfo"  %>
<%@ page import="model.bean.pagesession"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>Student Information View</title><meta name="viewport" content="width=device-width, initial-scale=1">
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
	<link rel="stylesheet" href="pagination.css">
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
	int pagesize=4;
	pagesession pages=(pagesession)request.getAttribute("pages");
%>
<body style="margin:0;padding:0;">
<div class="error-pagewrap">
	<div class="error-page-int">
		<div class="content-error">
			<div class="panel-body">
				<div class="hpanel">
					<div class="form-group">
						<div class="fixed-table-container" style="padding-bottom: 0px;">
							<div class="fixed-table-body">
								<table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true"
									   data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true"
									   data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true"
									   data-click-to-select="true" data-toolbar="#toolbar" class="table table-hover JColResizer">
									<thead>
									<tr>
										<th style="width: 5%;" data-field="id" tabindex="0">
											<div class="th-inner ">Student ID</div>
											<div class="fht-cell"></div>
										</th>
										<th style="width: 30%;" data-field="name" tabindex="0">
											<div class="th-inner ">Name</div>
											<div class="fht-cell"></div>
										</th>
										<th style="width: 15%;" data-field="gender" tabindex="0">
											<div class="th-inner ">Gender</div>
											<div class="fht-cell"></div>
										</th>
										<th style="width: 20%;" data-field="birth" tabindex="0">
											<div class="th-inner ">DOB</div>
											<div class="fht-cell"></div>
										</th>
<%--										<th style="width: 20%;" data-field="hobby" tabindex="0">--%>
<%--											<div class="th-inner ">hobby</div>--%>
<%--											<div class="fht-cell"></div>--%>
<%--										</th>--%>
										<th style="width: 10%;" data-field="action" tabindex="0">
											<div class="th-inner ">Action</div>
											<div class="fht-cell"></div>
										</th>
									</tr>
									</thead>
									<tbody  id="paginated-list" data-current-page="1" aria-live="polite">
									<% for(int i=0;i<list.size();i++) { %>
									<tr>
										<td>
											<%=list.get(i).getStudentId()%>
										</td>
										<td>
											<%=list.get(i).getStudentName()%>
										</td>
										<td>
											<%=list.get(i).getGender()%>
										</td>
										<td>
											<%=list.get(i).getBirth()%>
										</td>
<%--										<td>--%>
<%--											<%=list.get(i).getFavorite()%>--%>
<%--										</td>--%>
										<td>
											<a href="personinfoset.do?id=<%=list.get(i).getStudentId()%>">View</a>
											<a href="javascript:deleteAStudent('<%=list.get(i).getStudentId()%>')">Delete</a>&nbsp;
										</td>
									</tr>
									<% } %>
									<% if(pages.getTotalPage()>pagesize){%>
									<tr style="margin-top:30px;margin-left:30px;">
										<td colspan="7">
											<%=pages.getPagestr()%>
										</td>
									</tr>
									<%}%>
									</tbody>
								</table>
								<nav class="pagination-container">
									<button class="pagination-button" id="prev-button" aria-label="Previous page" title="Previous page">
										&lt;
									</button>

									<div id="pagination-numbers">

									</div>

									<button class="pagination-button" id="next-button" aria-label="Next page" title="Next page">
										&gt;
									</button>
								</nav>
							</div>
							<div class="fixed-table-footer" style="display: none;">
								<table>
									<tbody>
									<tr></tr>
									</tbody>
								</table>
							</div>
						</div>
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
			// perform delete operation
		}
	}
</script>
<script src="pagination.js"></script>
