<%@ page import="java.sql.*" %>
<%@ page import="jdk.nashorn.api.tree.WhileLoopTree" %>
<%--
  Created by IntelliJ IDEA.
  User: Rahul
  Date: 22-04-2018
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find Projects to Work</title>

    <%--jquery cdn for form validations--%>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.17.0/jquery.validate.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.17.0/additional-methods.js"></script>

    <%--stylesheet and js for bootstrap--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%--stylesheet to use google material icons--%>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <%--additional stylesheets and js files for user defined actions--%>
    <link rel="stylesheet" href="mycss/style.css">

    <style>
        body {
            font-family: Helvetica;
            background: #F5F5F5;
        }
        nav{
            background-color: rgb(56,54,67);
        }

        h2{
            margin-top: 85px;
        }

        .panel > .panel-heading {
            background-image: none;
            background-color: rgb(56, 54, 67);
            /*color: rgb(242, 93, 70);*/
            color: #fff;
            font-family: 'Roboto', sans-serif;
        }

        .my-panels{
            margin-top: 20px;
        }

        .label, .label-danger{
            margin-right: 2px;
            margin-left: 2px;
        }
        .modal-header, .modal-footer {
            background-image: none;
            background: linear-gradient(to right, #00467F, #A5CC82);
            color: #fff;
        }
    </style>
</head>
<body>

<%--Declaring variables--%>
<%!
    String userID = "";
    String accordion  = "collapse";
    String lang, memberDesc, uploadedBy, uploaderEmail, timePeriod = "";
    int i = 0;
    String framework = "";
%>

<%
    if (session.getAttribute("login_session") == null) {
        response.sendRedirect("index.jsp");
    }else{
        String name = (String) session.getAttribute("login_session");
%>

<nav>
    <div class="container">
        <img src="team_logo.png" alt="LOGO" width="50" height="50">
        <div class="logo"><span>TEAM-MAKER</span></div>
        <ul class="mainNav">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="/index.jsp#about">About</a></li>
            <li><a href="upload.jsp">Upload</a></li>
            <li><a href="find.jsp">Find</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <%=name%><span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<%
    }
%>
<div class="container">
    <h2>Find</h2>
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamfinder", "root", "");
        PreparedStatement pr = con.prepareStatement("SELECT * FROM desctable order by desc_id desc");
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            i++;
            userID = rs.getString(2);
            PreparedStatement p = con.prepareStatement("SELECT * from register1 where register_id = '"+userID+"' ");
            ResultSet r = p.executeQuery();
            while (r.next()) {
                uploadedBy = r.getString(2);
                uploaderEmail = r.getString(3);
            }

            lang = rs.getString(4);
            String[] langArray = lang.split(",");
            framework = rs.getString(5);
            if (framework.equals("")) {
                framework = "Not Specified";
            }
            memberDesc = rs.getString(7);
            String[] memberDescArray = memberDesc.split(",");

            timePeriod = rs.getString(9);
    %>

    <div class="panel-group my-panels" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href=<%="#"+accordion+i%>>
                        <span class="label label-success"><%=i%></span><%=rs.getString(3)%>
                        <span class="label label-danger pull-right"><%=langArray[1]%></span>
                        <span class="label label-danger pull-right"><%=langArray[0]%></span>
                    </a>
                </h4>
            </div>
            <div class="panel-collapse collapse in" id=<%=accordion+i%> >
                <div class="panel-body">
                    <ul class="list-group">
                        <li class="list-group-item"><b>Most important language required : </b><%=lang%></li>
                        <li class="list-group-item"><b>Framework required : </b><%=framework%> </li>
                        <li class="list-group-item">
                            <b>Number of team member(s) required : </b><%=rs.getString(6)%><br>
                            <%
                                for (int k = 1; k <= memberDescArray.length; k++) {
                                    %> <b>Member <%=k%> for : </b><%=memberDescArray[k-1]%><br>
                            <%
                                }
                            %>
                        </li>
                        <li class="list-group-item"><b>Uploader already has : </b><%=rs.getString(8)%></li>
                        <li class="list-group-item"><b>Time to complete this project : </b><%=timePeriod%></li>
                    </ul>
                    <button class="btn btn-success" data-toggle="modal" data-target="#detailModal">I'm interested in this project</button>
                </div>

                <%--Panel Footer--%>
                <div class="panel-footer"><b>Uploaded By : </b><%=uploadedBy%>(<%=uploaderEmail%>)</div>
                </div>
            </div>
        </div>
    <%
        }
        i = 0;
    } catch (ClassNotFoundException e) {
                e.printStackTrace();
    } catch (SQLException e) {
                e.printStackTrace();
    }
%>


</div>

<%--footer--%>
<div class="footer-basic">
    <footer>

        <div class="footer-logo">TEAM-MAKER</div>

        <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>

        <p class="copyright">&copy; 2018 All Rights Reserved.</p>
        <img src="team_logo.png" alt="LOGO" width="60" height="60">
    </footer>
</div>

<%--Modal for displaying details--%>
<div id="detailModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Contact the uploader</h4>
            </div>
            <div class="modal-body">
                <b>Start communicatin today. Simply email the uploader and wait for the response</b><br><br>
                <b>Name of the Uploader : </b><%=uploadedBy%> <br>
                <b>Uploader's Email : </b><%=uploaderEmail%> <br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Okay</button>
            </div>
        </div>

    </div>
</div>

</body>
</html>
