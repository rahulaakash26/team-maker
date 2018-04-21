package descupload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamfinder", "root", "");
            PreparedStatement pr = con.prepareStatement("select * from register1 where email='"+session_email+"'");
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                i++;
                mUserID = rs.getString(1);
            }
            System.out.println(mUserID);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
