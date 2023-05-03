package controller;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CityInfo;
import model.bean.Provinc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class QueryCity extends HttpServlet {
    public QueryCity() {
        super();
    }

    public void destroy() {
        super.destroy();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		*/
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //request.setCharacterEncoding("gb2312");
        System.out.println("okok");
        String province=request.getParameter("province");
        System.out.println(province);
        province=new String(province.getBytes("iso8859-1"),"UTF-8");
        System.out.println(province);
        CityInfo dao=new CityInfo();
        List<Provinc> list =dao.findByProvinceName(province);

        Gson gson = new Gson();
        String gsonStr=gson.toJson(list);
        System.out.println(gsonStr);
        out.print(gsonStr);
        out.flush();
        out.close();


    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("    This is ");
        out.print(this.getClass());
        out.println(", using the POST method");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }

    public void init() throws ServletException {
    }
}
