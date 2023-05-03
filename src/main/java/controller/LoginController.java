package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.dao.Userinfo;
import model.bean.student;
import model.bean.teacher;
import dbConnection.StringUtil;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginController", value = "/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        System.out.println(basePath);

        // 1.Get parameters
        request.setCharacterEncoding("UTF-8");

        String password = request.getParameter("password");
        password= StringUtil.MD5(password);
        String code = request.getParameter("code");
        String identity = request.getParameter("RadioButtonList");
        System.out.println(identity);
        HttpSession session = request.getSession();
        String code1 = (String) session.getAttribute("code");
        if (!code.equals(code1)) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("  <script >");
            out.println(" alert('The verification code you entered is incorrect. Please try again.')");
            out.println("window.location='" + basePath + "/login.jsp'");
            out.println(" </script>");
            out.flush();
            out.close();
            return;
        }


        // 2.Invoke the corresponding model to implement business logic processing.
        Userinfo dao = new Userinfo();
        if (identity.equals("Teacher")) {
            String tnumber = request.getParameter("username");
            System.out.println(tnumber + "," + password);
            boolean ret = dao.checkTeacherLogin(tnumber, password);

            // 3.Based on the processing result, provide different responses to the client.
            if (ret) {// Successfully logged in.
                // In some cases, store certain globally shared data (of any type) in the session, and retrieve it for relevant usage when needed
                Userinfo dao1 = new Userinfo();
                teacher currentUser = dao1.findBytName(tnumber);
                session.setAttribute("currentUser", currentUser);
                response.sendRedirect(basePath + "teacherindex.jsp");
            } else { // Login failed
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("  <script >");
                out.println(" alert('The password you entered is incorrect. Please try again.')");
                out.println("window.location='" + basePath + "/login.jsp'");
                out.println(" </script>");
                out.flush();
                out.close();
            }
        }
        else{
            String studentid = request.getParameter("username");
            System.out.println(studentid + "," + password);
            boolean ret = dao.checkStudentLogin(studentid, password);

            // 3.In accordance with the processing result, provide different responses to the client.
            if (ret) {// Successful login
                // Store certain globally shared data (of any type) in the session, and retrieve it for relevant use when needed.
                Userinfo dao1 = new Userinfo();
                student currentUser = dao1.findBysName(studentid);
                session.setAttribute("currentUser", currentUser);
                response.sendRedirect(basePath + "studentindex.jsp");
            } else { // Login failed
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("  <script >");
                out.println(" alert('The password you entered is incorrect. Please try again.')");
                out.println("window.location='" + basePath + "/login.jsp'");
                out.println(" </script>");
                out.flush();
                out.close();
            }
        }
    }

}
