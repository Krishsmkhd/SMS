package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.dao.Userinfo;
import model.bean.student;
import model.bean.teacher;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CheckUserName", value = "/CheckUserName")
public class CheckUserName extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CheckUserName() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String userName=request.getParameter("userName");
        System.out.println(userName);
        Userinfo dao=new Userinfo();
        teacher user1=dao.findBytName(userName);
        student user2=dao.findBysName(userName);
        if(user1.getTeacherNum()!=null||user2.getStudentId()!=null){
            out.print("y");
        }
        else{
            out.print("n");
        }
        out.flush();
        out.close();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
