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
            background-color: rgb(56,54,67);
            color: white;
        }

        .form-group{
            margin-bottom: 40px;
        }
    </style>

    <script type="text/javascript">
        function addFields() {
            var number = document.getElementById("team-members").value;
            var container = document.getElementById("member_area");
            while (container.hasChildNodes()) {
                container.removeChild(container.lastChild);
            }
            for (i=0;i<number;i++){
                var textnode = document.createTextNode("Member " + (i+1) + " for :");
                var span = document.createElement('span');
                span.id = "span1";
                span.appendChild(textnode);
                container.appendChild(span);

                var input = document.createElement("input");
                input.type = "text";
                input.name = "member" + i;
                input.className = "form-control";
                input.id = "member" + i;
                input.placeholder = "Eg: front-end development";
                input.required = true;
                container.appendChild(input);
                container.appendChild(document.createElement("br"));
            }
        }
    </script>

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

<div class="container">
    <h2>Upload</h2>
    <div class="panel panel-primary">
        <div class="panel-heading">Upload Project Description</div>
        <div class="panel-body">
            <form action="/descupload" method="post" class="upload-form" id="upload_form">
                <div class="form-group">
                    <label for="project_desc">Describe the work to be done</label>
                    <textarea class="form-control" name="project_desc" id="project_desc" rows="5" placeholder="Describe your project idea in brief so everyone can known what is it you expect from them"></textarea>
                </div>
                <div class="form-group">
                    <label for="skills_required">Two most important programming languages the member should know?</label>
                    <input type="text" id="skills_required" name="skills_required" class="form-control" placeholder="Example java, python" required>
                </div>

                <div class="form-group">
                    <label for="framework">Which software frameworks do you prefer to use?<small>(optional)</small></label>
                    <input type="text" id="framework" name="framework" class="form-control" placeholder="Example Hibernate, django">
                </div>

                <div class="form-group">
                    <label for="team-members">How many team members do you need for this project?</label>
                    <div class="row">
                        <div class="col-md-9">
                            <input type="text" class="form-control error" name="team-members" id="team-members" placeholder="Number of team members" required>
                        </div>
                        <div class="col-md-3">
                            <a href="#" id="add_members" class="btn btn-danger" onclick="addFields()">Add Member Description</a>
                        </div>
                    </div>
                    <div id="member_area"></div>
                </div>

                <div class="form-group">
                    <label>Where are you in the lifecycle of this project?</label>
                    <div class="row">
                        <div class="col-md-3"><i class="material-icons" style="font-size:60px;">developer_board</i>
                            <div class="radio"><label><input type="radio" name="lifecycle" value="design"/>I have designs</label></div>
                        </div>
                        <div class="col-md-3"><i class="material-icons" style="font-size:60px;">assignment</i>
                            <div class="radio"><label><input type="radio" name="lifecycle" value="specifications"/>I have specifications</label></div>
                        </div>
                        <div class="col-md-3"><i class="material-icons" style="font-size:60px;">lightbulb_outline</i>
                            <div class="radio"><label><input type="radio" name="lifecycle" value="idea"/>I have an idea</label></div>
                        </div>
                        <div class="col-md-3"><i class="material-icons" style="font-size:60px;">cancel</i>
                            <div class="radio"><label><input type="radio" name="lifecycle" value="nothing"/>Don't know now</label></div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3">
                            <label for="sel1">How long do you expect this project to last?</label>
                        </div>
                        <div class="col-md-3 float-left">
                            <select class="form-control" id="sel1" name="timeperiod">
                                <option value="More than 6 Months">More than 6 Months</option>
                                <option value="3-6 Months">3-6 Months</option>
                                <option value="1-3 Months">1-3 Months</option>
                                <option value="Less than 1 Month">Less than 1 Month</option>
                            </select>
                        </div>
                    </div>
                </div>
                <input type="reset" value="Reset the form" class="button5">
                <input type="submit" value="Upload Description" class="button5">
            </form>
        </div>
    </div>
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

</body>
</html>