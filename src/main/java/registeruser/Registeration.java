package registeruser;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class Registeration extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        String name, email, password;
        name = request.getParameter("name");
        email = request.getParameter("email");
        password = request.getParameter("pwd");
        PrintWriter writer = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamfinder", "root", "");
            PreparedStatement pr = con.prepareStatement("insert into register1 (name, email, password) VALUES('" + name + "','" + email + "','" + password + "') ");
            pr.executeUpdate();
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.include(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
            writer.print("<script>alert('Something Went Wrong');</script>");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
            writer.print("<script>alert('Something Went Wrong');</script>");
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
