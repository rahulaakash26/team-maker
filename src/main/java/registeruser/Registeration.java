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

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamfinder", "root", "");
            PreparedStatement pr = con.prepareStatement("insert into register (name, email, password) VALUES('" + name + "','" + email + "','" + password + "') ");
            pr.executeUpdate();
            PrintWriter writer = response.getWriter();
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            writer.println("<h1>Success</h1>");
            dispatcher.include(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
