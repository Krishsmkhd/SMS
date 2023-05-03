<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="model.bean.studentinfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>View Personal Information</title>
<style>
a{color:#003163;}
a:hover{color:red;}
th, td {
    vertical-align: top;
}
.portlet-form-table td {
    width: 100px;
    padding-bottom: 4px;
}
.portlet-form-table td {
    padding: 5px;
}
.portlet-form-table th {
    width: 60px;
    text-align: right;
}
.portlet-form-table th {
    color: #003163;
	font-weight:normal;
    padding: 5px 0;
    white-space: nowrap;
}

</style>
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
	  String gender=studenti.getGender();
	  String maleChecked="";
	  String femaleChecked="";
	  if(gender!=null){
	  if(gender.equals("male"))
		maleChecked="checked";
	  if(gender.equals("female"))
		femaleChecked="checked";}
	  String favorite=studenti.getFavorite();
	  String singChecked="";
	  String danceChecked="";
	  String programChecked="";
	  String swingChecked="";
	  if(favorite!=null){
	  if(favorite.contains("Sing"))
		singChecked="checked";
	  if(favorite.contains("Dance"))
		danceChecked="checked";
	  if(favorite.contains("Programming"))
		programChecked="checked";
	  if(favorite.contains("Swmming"))
		swingChecked="checked";	}
%>
<body style="margin:0;padding:0;">
<div style="width:850px;margin:0 auto;">
    <div class="error-pagewrap">
        <div class="error-page-int">
            <div class="content-error">
                <div class="hpanel">
                    <div class="panel-body">
                        <div class="form-group"><form action="personinfoset.do" method="post">
                            <fieldset class="step">
                                <legend>Personal Information</legend>
                                <table class="portlet-form-table" width="98%">
                                    <tbody><tr>
                                        <th><label for="studentId">Student ID</label></th>
                                        <td>
                                            <input id="studentId" type="text" name="studentid" value="<%=studenti.getStudentId()%>" readonly=""/>
                                        </td>
                                    </tr>
                                    <tr>

                                        <th><label for="name">Name</label></th>
                                        <td>
                                            <input id="name" type="text" name="name" value="<%=studenti.getStudentName()%>" readonly=""/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><label for="odlname">Former Name</label></th>
                                        <td>
                                            <input id="odlname" type="text" name="oldname" value="<%=studenti.getOldname() %>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><label for="gender">Gender</label></th>
                                        <td>
                                            <input id="gender" name="gender" type="radio" value="male" <%=maleChecked%>/>male
                                            <input name="gender" type="radio" value="female" <%=femaleChecked%>/>female
                                        </td>

                                    </tr>

                                    <tr>
                                        <th><label for="studentsf">Hobby</label></th>
                                        <td>
                                            <input id="studentsf" type="text" name="studentsf" value="<%=studenti.getStudentsf() %>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><label for="nation">Nationality</label></th>
                                        <td>
                                            <input id="nation" type="text" name="nation" value="<%=studenti.getNation() %>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><label for="birth">Date of Birth</label></th>
                                        <td>
                                            <input id="birth" type="text" name="birth" value="<%=studenti.getBirth()%>"/>
                                        </td>

                                        <th><label for="from">Hometown</label></th>
                                        <td>
                                            <input id="from" type="text" name="from" value="<%=studenti.getFrom() %>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><label id="sfrom" for="sfrom">Place of Origin</label></th>
                                        <td>
                                            <select name="province" id="province" onchange="queryCity();">
                                                <option>Please select a province or city</option>
                                                <option value="Bagmati">Bagmati</option>
                                                <option value="Gandaki">Gandaki</option>
                                            </select>
                                        </td>

                                        <th><label for="health">Health Status</label></th>
                                        <td>
                                            <input id="health" type="text" name="health" value="<%=studenti.getHealth() %>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label for="contry">Country</label></th>
                                        <td>
                                            <input id="contry" type="text" name="contry" value="<%=studenti.getContry() %>"/>
                                        </td>

                                        <th><label for="red">Blood Type</label></th>
                                        <td>
                                            <input id="red" type="text" name="red" value="<%=studenti.getRed() %>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><label for="ocity">Residence Before Admission</label></th>
                                        <td>
                                            <input id="ocity" type="text" name="ocity" value="<%=studenti.getOcity() %>"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><label for="ncity">Residence After Admission</label></th>
                                        <td>
                                            <input id="ncity" type="text" name="ncity" value="<%=studenti.getNcity() %>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                        <th><label for="school">School</label></th>
                                        <td>
                                            <input id="school" type="text" name="school" value="<%=studenti.getSchool() %>"/>
                                        </td>
                                        <th><label for="weight">Weight</label></th>
                                        <td>
                                            <input id="weight" type="text" name="weight" value="<%=studenti.getWeight() %>"/>
                                        </td>
                                    </tr>
                                    <tr>

                                        <th><label for="height">Height</label></th>
                                        <td>
                                            <input id="height" type="text" name="height" value="<%=studenti.getHeight() %>"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label for="favorite">Hobbies:</label></th>
                                        <td>
                                            <input id="favorite" type="checkbox" name="favorite" value="Sing" <%=singChecked%>/>Sing
                                            <input type="checkbox" name="favorite" value="Dance" <%=danceChecked%>/>Dance
                                            <input type="checkbox" name="favorite" value="Programming" <%=programChecked%>/>Programming
                                            <input type="checkbox" name="favorite" value="Swimming" <%=swingChecked%>/>Swimming
                                        </td>
                                    </tr>
                                    </tbody></table>
                                <p style="text-align:center">
                                    <input id="" type="submit" name="submit" value="Save"/>
                                </p>
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
var xmlHttp;
function createXMLHttp(){
		if(window.XMLHttpRequest){
			xmlHttp=new XMLHttpRequest();
		}else{
			xmlHttp=new ActivexObject("Microsoft.XMLHTTP");
		}
	}
	
function queryCity(){
		createXMLHttp();
		var province=document.getElementById("province").value;
		xmlHttp.open("get","QueryCity.do?province="+province);
		xmlHttp.onreadystatechange=fillCitycallBack;

		xmlHttp.send(null);

	}
	
	function fillCitycallBack(){
		if(xmlHttp.readyState==4){
			if(xmlHttp.status==200){
				var text=xmlHttp.responseText;
				var ose=document.getElementById("city");

				text='{"province":'+text+"}";
				var cityObj=eval("("+text+")");
			
					for(var i=0;i&lt;cityObj.province.length;i++){
					var oop=document.createElement('option');
						ose.appendChild(oop);
						
						oop.value=cityObj.province[i].city;
						oop.innerHTML=cityObj.province[i].city;
				}
				
			}
		}
	
	}
</script>