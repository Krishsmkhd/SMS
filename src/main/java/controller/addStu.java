package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.Userinfo;
import model.bean.student;
import dbConnection.StringUtil;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "addStu", value = "/addStu")
public class addStu extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addStu() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.Get request parameters, perform encoding conversion if necessary.
        request.setCharacterEncoding("UTF-8");
        String studentid = request.getParameter("studentid");
        String sname = request.getParameter("name");
        String spwd = StringUtil.MD5(studentid);
        ////2.Invoke the model to perform business logic processing
        //Encapsulate the parameters required when calling a method.
        student student=new student();
        student.setStudentId(studentid);
        student.setsName(sname);
        student.setSpwd(spwd);
        Userinfo dao=new Userinfo();
        boolean success=dao.insertStudent(student);

        //3.Client response, after prompting, returns to queryCondition.jsp
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        if (success) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("  <script >");
            out.println(" alert('Addition Successful!')");
            out.println("window.location='" + basePath + "/index.jsp'");
            out.println(" </script>");
            out.flush();
            out.close();
        }
        else{
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("  <script >");
            out.println(" alert('Add failed, please try adding again!')");
            out.println("window.location='" + basePath + "/addstudent.jsp'");
            out.println(" </script>");
            out.flush();
            out.close();
        }

    }
}
