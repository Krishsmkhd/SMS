package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.Studentinformation;
import model.dao.Userinfo;
import model.bean.student;
import model.bean.studentinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "personinfoset", value = "/personinfoset")
public class personinfoset extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public personinfoset() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.Get request parameters
        String id=request.getParameter("id");
        HttpSession session = request.getSession();
        //2.Call the model to execute business logic processing.
        Studentinformation dao=new Studentinformation();
        studentinfo student=new studentinfo();
        student.setStudentId(id);
        ArrayList<studentinfo> list=dao.query(student);
        //3.Client response, returning data to the client as needed.
        Userinfo dao1 = new Userinfo();
        student currentUser = dao1.findBysName(id);
        if(list.size()<1){
            studentinfo s=new studentinfo();
            s.setStudentId(currentUser.getStudentId());
            list.add(s);
        }
        list.get(0).setStudentName(currentUser.getsName());
        session.setAttribute("studentInfo", list.get(0));  //key-value

        //server-side redirection
        request.getRequestDispatcher("/mstudentinfo.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.Get request parameters and perform encoding conversion if necessary.
        request.setCharacterEncoding("UTF-8");
        String studentId=request.getParameter("studentid");
        String studentName=request.getParameter("name");
        String imgfile=request.getParameter("imgfile");
        String studentimg=request.getParameter("imgfile");
        String gender=request.getParameter("gender");
        String birth=request.getParameter("birth");
        String oldname=request.getParameter("oldname");
        String studentsf=request.getParameter("studentsf");
        String nation=request.getParameter("nation");
        String life=request.getParameter("life");
        String province=request.getParameter("province");
        String city=request.getParameter("city");
        String sfrom=province+" "+city;
        String health=request.getParameter("health");
        String contry=request.getParameter("contry");
        String red=request.getParameter("red");
        String ocity=request.getParameter("ocity");
        //String from=request.getParameter("from");
        String fromx=request.getParameter("fromx");
        String ncity=request.getParameter("ncity");
        String yhcar2=request.getParameter("yhcar2");
        String yhcar=request.getParameter("yhcar");
        String school=request.getParameter("school");
        String weight=request.getParameter("weight");
        String height=request.getParameter("height");
        String hat=request.getParameter("hat");
        String fav[]=request.getParameterValues("favorite");
        String motion=request.getParameter("motion");
        String favorite="";
        //Combine multiple interests and hobbies into a single string, separated by commas.
        for(int i=0;i<fav.length;i++){
            favorite+=fav[i]+",";
        }
        //Remove the last one
        if(favorite.length()>0)
            favorite=favorite.substring(0,favorite.length()-1);

        //2.Invoke model to execute business logic processing
        //Encapsulate the parameters required for method invocation
        studentinfo  student=new studentinfo();
        student.setStudentId(studentId);
        student.setStudentName(studentName);
        student.setBirth(birth);
        student.setGender(gender);

        student.setGender(gender);
        student.setBirth(birth);
        student.setOldname(oldname);
        student.setStudentsf(studentsf);
        student.setNation(nation);
        student.setHeight(height);
        student.setContry(contry);
        student.setRed(red);
        student.setOcity(ocity);
        student.setHealth(health);
        student.setNcity(ncity);
        student.setSchool(school);
        student.setWeight(weight);
        student.setFavorite(favorite);
        Studentinformation dao=new Studentinformation();
        boolean success=dao.updateinfo(student);

        //3.After client response and prompt, return to queryCondition.jsp.
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        if(success){
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("  <script >");
            out.println(" alert('Modification Successful!')");
            out.println("window.location='"+basePath+"/studentindex.jsp'");
            out.println(" </script>");
            out.flush();
            out.close();
        }

    }
}
