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

@WebServlet(name = "updatesUser", value = "/updatesUser")
public class updatesUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updatesUser() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.Get request parameters and perform encoding conversion if necessary.
        request.setCharacterEncoding("UTF-8");
        String newpassword=request.getParameter("newpassword1");
        String studentId=request.getParameter("uid");
        String snikname=request.getParameter("nikname");
        String semail=request.getParameter("email");

        //2.Invoke the model to execute business logic processing.
        //Encapsulate the parameters required for method invocation
        student student=new student();

        student.setStudentId(studentId);
        student.setSpwd(StringUtil.MD5(newpassword));
        student.setSnikname(snikname);
        student.setSemail(semail);
        Userinfo dao=new Userinfo();
        boolean success=dao.updatesUser(student);

        //3.After the client-side response and prompt, return to queryCondition.jsp.
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        if(success){
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("  <script >");
            out.println(" alert('Modification successful!')");
            out.println("window.location='"+basePath+"/studentindex.jsp'");
            out.println(" </script>");
            out.flush();
            out.close();
        }

    }
}
