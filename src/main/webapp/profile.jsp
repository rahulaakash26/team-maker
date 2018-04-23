<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Rahul
  Date: 23-04-2018
  Time: 10:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>

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

        .panel > .panel-heading {
            background: rgb(56, 54, 67) none;
            color: #fff;
            font-family: 'Roboto', sans-serif;
        }

        .profile-container {
            margin-top: 150px;
        }

        .active, nav ul li a:hover {
            text-decoration: none;
            color: black;
            background-color: #F5F5F5;
        }

        .nav-pills > li.active > a, .nav-pills > li.active > a:focus {
            background-color: rgb(56, 54, 67);
        }

        .nav-pills a{
            color: rgb(56, 54, 67);
        }


    </style>

</head>
<body>
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
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <%
        }
    %>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamfinder", "root", "");
            String email = (String) session.getAttribute("login_email");
            PreparedStatement pr = con.prepareStatement("select * from register1 where email='" + email + "' ");
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
    %>
    <div class="container profile-container">
        <div class="row">
            <div class="col-md-3">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a data-toggle="pill" href="#home"><i class="glyphicon glyphicon-user pull-left"></i>Profile</a></li>
                    <li><a data-toggle="pill" href="#menu1"><i class="glyphicon glyphicon-list-alt pull-left"></i>Uploads</a></li>
                    <li><a data-toggle="pill" href="#menu2"><i class="glyphicon glyphicon-lock pull-left"></i>Change Password</a></li>
                    <li><a data-toggle="pill" href="#menu3"><i class="glyphicon glyphicon-cog pull-left"></i>Settings</a></li>
                </ul>
            </div>

            <div class="col-md-9">
                <%--tab content--%>
                <div class="tab-content">

                    <%--Profile tab--%>
                    <div id="home" class="tab-pane fade in active">
                        <h3>Profile</h3>
                        <div class="panel panel-default">
                            <div class="panel-heading">Name</div>
                            <div class="panel-body">
                                <%=rs.getString(2)%>
                                <span class="pull-right"><button class="btn btn-danger">Edit</button></span>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">Email</div>
                            <div class="panel-body">
                                <%=rs.getString(3)%>
                                <span class="pull-right"><button class="btn btn-danger">Edit</button></span>
                            </div>
                        </div>
                    </div><%--end of profile tab--%>

                    <%--Uploads tab--%>
                    <div id="menu1" class="tab-pane fade">
                        <h3>Menu 1</h3>
                        <p>Some content in menu 1.</p>
                    </div>

                    <%--Change Password Tab--%>
                    <div id="menu2" class="tab-pane fade">
                        <h3>Change Password</h3>
                        <%--form to take new password--%>
                        <form action="" method="post">
                            <%--new password--%>
                            <div class="panel panel-info" style="margin: 1em;">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><label for="new_password" class="control-label panel-title">New Password</label></h3>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" name="password" id="new_password" >
                                        </div>
                                    </div>

                                </div>
                            </div><%--end of new password--%>

                            <%--Confirm password--%>
                            <div class="panel panel-info" style="margin: 1em;">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><label for="confirm_password" class="control-label panel-title">Confirm password</label></h3>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" name="password_confirmation" id="confirm_password" >
                                        </div>
                                    </div>
                                </div>
                            </div><%--end of confirm password--%>

                            <%--submit button--%>
                            <div class="panel panel-info border" style="margin: 1em;">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="pull-left">
                                            <input type="submit" class="form-control btn btn-primary" name="submit" id="submit" value="Change Password">
                                        </div>
                                    </div>
                                </div>
                            </div><%--end of submit button--%>

                        </form><%--end of form--%>
                    </div><%--end of change password tab--%>

                    <%--Settings tab--%>
                   <div id="menu3" class="tab-pane fade">
                        <h3>Menu 3</h3>
                        <p>Some content in menu 3.</p>
                    </div><%--end of setting tab--%>

                </div><%--end of tabcontent--%>
            </div><%--end of col-md-9--%>
        </div><%--end of row--%>
    </div><%--end of container--%>
    <%
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

</body>
</html>
