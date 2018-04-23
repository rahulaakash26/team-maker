package registeruser;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Result;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email, password;
        int i = 0;
        email = request.getParameter("login_email");
        password = request.getParameter("login_pwd");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamfinder", "root", "");
            PreparedStatement pr = con.prepareStatement("select * from register1 where email='" + email + "' and password='" + password + "'");
            ResultSet rs = pr.executeQuery();
            PrintWriter writer = response.getWriter();
            while (rs.next()) {
                String name = rs.getString("name");
                int registerID = rs.getInt(1);
                HttpSession session = request.getSession();
                session.setAttribute("login_session", name);
                session.setAttribute("login_email", email);
                session.setAttribute("login_id", registerID);
                i++;
                response.sendRedirect("index.jsp");
            }
            if (i == 0) {
                writer.print("<script>alert('Incorrect Email or Password. Check your credentials and enter again');</script>");
                response.sendRedirect("index.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
