package descupload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class DescUpload extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mUserID = "", mDescSum, mLang, mFramework, mTeamMember, mTeamDesc, mLifecycle, mTimePeriod;
        mDescSum = request.getParameter("project_desc");
        mLang = request.getParameter("skills_required");
        mFramework = request.getParameter("framework");
        mTeamMember = request.getParameter("team-members");
        int members = Integer.parseInt(mTeamMember);
        String s = "";
        for (int i = 0; i < members; i++) {
            s = s+request.getParameter("member"+i)+",";
        }
        mTeamDesc = s.substring(0, s.length()-1);
        mLifecycle = request.getParameter("lifecycle");
        mTimePeriod = request.getParameter("timeperiod");

        HttpSession session = request.getSession();
        String session_email = (String) session.getAttribute("login_email");

        int i = 0;
        PrintWriter out = response.getWriter();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamfinder", "root", "");
            PreparedStatement pr = con.prepareStatement("select * from register1 where email='"+session_email+"'");
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                i++;
                mUserID = rs.getString(1);
            }

            PreparedStatement pr2 = con.prepareStatement("insert into desctable (user_id, desc_sum, lang, framework, team_member, team_desc, lifecycle, time_period) values ('" + mUserID + "', '" + mDescSum + "', '" + mLang + "', '" + mFramework + "', '" + mTeamMember + "', '" + mTeamDesc + "', '" + mLifecycle + "', '" + mTimePeriod + "')");
            pr2.executeUpdate();
            RequestDispatcher dispatcher = request.getRequestDispatcher("find.jsp");
            out.print("<script>alert('Description has been successfully posted');</script>");
            dispatcher.include(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.print("<script>alert('Something Went Wrong');</script>");
            response.sendRedirect("upload.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            out.print("<script>alert('Something Went Wrong');</script>");
            response.sendRedirect("upload.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
