package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.Userinfo;
import model.bean.teacher;
import dbConnection.StringUtil;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "updatetUser", value = "/updatetUser")
public class updatetUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updatetUser() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.Get request parameters, and perform encoding conversion if necessary.
        request.setCharacterEncoding("UTF-8");
        String newpassword=request.getParameter("newpassword1");
        String teachernum=request.getParameter("uid");
        String tnikname=request.getParameter("nikname");
        String temail=request.getParameter("email");

        //2.Invoke the model to execute business logic processing.
        //Encapsulate the parameters required for method invocation
        teacher teacher=new teacher();

        teacher.setTeacherNum(teachernum);
        teacher.setTpwd(StringUtil.MD5(newpassword));
        teacher.setTnikname(tnikname);
        teacher.setTemail(temail);
        Userinfo dao=new Userinfo();
        boolean success=dao.updatetUser(teacher);

        //3.After the client response prompts, return to queryCondition.jsp.
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        if(success){
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("  <script >");
            out.println(" alert('Modification successful!')");
            out.println("window.location='"+basePath+"/teacherindex.jsp'");
            out.println(" </script>");
            out.flush();
            out.close();
        }

    }
}
