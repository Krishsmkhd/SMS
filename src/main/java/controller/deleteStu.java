package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.Studentinformation;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "deleteStu", value = "/deleteStu")
public class deleteStu extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteStu() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"
                +request.getServerPort()+path+"/";
        System.out.println(basePath);

        //1.Retrieve parameters
        String ids=request.getParameter("id");

        //2.Call the corresponding model to implement business logic processing
        Studentinformation dao=new Studentinformation();
        int iCount=dao.deleteStudent(ids);

        //3.In accordance with the processing result, provide different responses to the clients.
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("  <script >");
        out.println(" alert('Successfully deleted "+iCount/2+" records!')");
        out.println("window.location='"+basePath+"/studentsinfo.jsp'");
        out.println(" </script>");
        out.flush();
        out.close();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
