<%--
  Created by IntelliJ IDEA.
  User: Rahul
  Date: 14-04-2018
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload Description</title>
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
        nav{
            background-color: rgb(56,54,67);
        }
        .upload-form {
            margin-top: 100px;
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
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#">Upload</a></li>
            <li><a href="#">Find</a></li>
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
    <form action="" method="post" class="upload-form">
        <div class="form-group">
            <label for="project_desc">Briefly tell about your project</label>
            <textarea class="form-control" name="project_desc" id="project_desc" rows="5" placeholder="Describe your project idea in brief so everyone can known what is it you expect from them"></textarea>
        </div>
        <div class="form-group">
            <label for="skills_required">Skills needed (Comma Separated)</label>
            <input type="text" id="skills_required" class="form-control error" placeholder="Enter the skills you need for your project. Separate by comma(,) if more than one." required>
        </div>
        <div class="form-group">
            <label for="team-members">How many team members do you need?</label>
            <input type="text" class="form-control error" id="team-members" placeholder="Number of team members" required>
        </div>
    </form>
</div>

</body>
</html>
