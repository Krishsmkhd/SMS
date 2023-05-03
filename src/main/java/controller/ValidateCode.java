package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

public class ValidateCode extends HttpServlet {
    public ValidateCode() {
        super();
    }

    public void destroy() {
        super.destroy();
    }

    public static final char[] CHARS = { '1', '2', '3', '4', '5', '6', '7',
            '8', '9', '0', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z', };
    public static Random random = new Random();

    public static String getRandomString() {
        StringBuffer buffer = new StringBuffer();
        for (int i = 0; i < 9; i++) {
            buffer.append(CHARS[random.nextInt(CHARS.length)]);
        }
        return buffer.toString();
    }

    public static Color getRandomColor() {
        return new Color(random.nextInt(255), random.nextInt(255), random
                .nextInt(255));
    }

    public static Color getReverseColor(Color c) {
        return new Color(255 - c.getRed(), 255 - c.getGreen(), 255 - c
                .getBlue());
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        //Create image object
        int width = 60,height = 20 ;
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB) ;

        Graphics g = image.getGraphics() ;

        //Generate random number.
        Random random = new Random() ;
        String s = "" ;
        for(int i=0;i<4;i++){
            s += random.nextInt(10) ;
        }

        System.out.println(s);

        //Store the random number in the session for later comparison.
        HttpSession session = request.getSession() ;
        session.setAttribute("code",s) ;

        //Generate a random color. Color color = new Color(255,255,255); The range of random.nextInt(256) is from 0 to 255.
        Color color = new Color(random.nextInt(256),random.nextInt(256),random.nextInt(256)) ;

        //Write random number onto an image
        String a = null ;
        Font font = new Font(a,Font.ITALIC,18) ;
        g.setColor(color) ;
        g.setFont(font);
        g.drawString(s,10,height-5) ;
        g.dispose() ;

        //Send the image to the client
        //(4)Send image byte stream to the client
        //Set output type and browser cache disabled.
        response.setContentType("image/jpeg") ;
        response.setHeader("Cache-Control", "no-cache") ;
        ServletOutputStream output = response.getOutputStream() ;
        ImageIO.write(image,"JPEG",output) ;
        output.flush();   //Close output stream

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

    @Override
    public void init() throws ServletException {
    }
}
