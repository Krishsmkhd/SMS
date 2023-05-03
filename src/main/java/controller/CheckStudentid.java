package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.dao.Userinfo;
import model.bean.student;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CheckStudentid", value = "/CheckStudentid")
public class CheckStudentid extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CheckStudentid() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String studentid=request.getParameter("studentid");
        System.out.println(studentid);
        Userinfo dao=new Userinfo();
        student student=dao.findBysName(studentid);
        if(student.getStudentId()==null){
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
