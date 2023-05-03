package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.Studentinformation;
import model.bean.pagesession;
import model.bean.studentinfo;
import dbConnection.StringUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "QueryController", value = "/QueryController")
public class QueryController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public QueryController() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        System.out.println(basePath);
        //1.Receive parameters sent by the client page, encode if necessary.
        request.setCharacterEncoding("UTF-8");
        String page=request.getParameter("page");
        String pagesize=request.getParameter("pagesize");

        //2.Call DAO to implement business logic processing.
        //Encapsulate query condition parameters
        pagesession pages=new pagesession();
        studentinfo studentCondition=new studentinfo();
        Studentinformation dao=new Studentinformation();

        ArrayList<studentinfo> list=dao.query(studentCondition);
        //ArrayList<studentinfo> list=dao.getAdminByPage(Integer.parseInt(page),Integer.parseInt(pagesize));
        int totalPage=(int)Math.ceil(1.0*dao.getTotalRows()/Integer.parseInt(pagesize));

        //3.Provide different client responses based on the results returned by DAO.
        if(list.size()>0){
            String pagestr= StringUtil.page(Integer.parseInt(page), totalPage, basePath);
            //（1）Client-side redirection, commonly used to directly open the target page without passing any data.
            //response.sendRedirect("queryResult.jsp");
            //（2）Server-side forward (forword), and various data can be passed to the target page.
            System.out.println(totalPage);
            System.out.println(dao.getTotalRows());
            pages.setPagestr(pagestr);
            pages.setTotalPage(dao.getTotalRows());
            request.setAttribute("pages", pages);
            request.setAttribute("queryResult", list);  //key-value
            request.getRequestDispatcher("/studentsinfo.jsp").forward(request,response);
        }
        else{
            //(3)Send pure text HTML string to the client-side.
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("  <script >");
            out.println(" alert('No students available. Please inform students to complete their personal information.')");
            out.println("window.location='"+basePath+"/teacherindex.jsp'");
            out.println(" </script>");
            out.flush();
            out.close();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        System.out.println(basePath);

        //1.Receive parameters sent by the client page and encode them if necessary.
        request.setCharacterEncoding("UTF-8");
        String studentId=request.getParameter("studentid");
        String studentName=request.getParameter("name");
        HttpSession session = request.getSession();
        //2.Call DAO to implement business logic processing
        //Encapsulate query condition parameters
        studentinfo studentCondition=new studentinfo();
        studentCondition.setStudentId(studentId);
        studentCondition.setStudentName(studentName);
        Studentinformation dao=new Studentinformation();
        ArrayList<studentinfo> list=dao.query(studentCondition);
        System.out.println(list.size());
        //3.Provide different client responses based on the results returned by DAO.
        if(list.size()==1){
            session.setAttribute("studentInfo", list.get(0));  //key-value
            request.getRequestDispatcher("/mstudentinfo.jsp").forward(request,response);
        }
        if(list.size()>1){
            //（1）Client-side redirection, commonly used for directly opening the target page without passing any data.
            //response.sendRedirect("queryResult.jsp");
            //（2）Server-side forward, while passing various data to the target page.
            request.setAttribute("queryResult", list);  //key-value
            request.getRequestDispatcher("/studentsqueryinfo.jsp").forward(request,response);
        }
        else{
            //(3)Sending plain text HTML string to the client
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("  <script >");
            out.println(" alert('No data that meets the conditions was found. Please try again.')");
            out.println("window.location='"+basePath+"/querystudent.jsp'");
            out.println(" </script>");
            out.flush();
            out.close();
        }
    }


}
