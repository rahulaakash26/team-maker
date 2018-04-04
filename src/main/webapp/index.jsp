<html>

<head>

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
    <script src="myjs/myscript.js"></script>
    <script src="myjs/Validations.js"></script>

    <%--code to make navbar black on scroll--%>
    <script type="text/javascript">
        $(window).on('scroll', function () {
            if ($(window).scrollTop()) {
                $('nav').addClass('black')
            } else {
                $('nav').removeClass('black')
            }
        });
    </script>
</head>

<body>
<%
    if (session.getAttribute("login_session") == null) {
%>
<%--navbar--%>
<nav>
    <div class="container">
        <div class="logo"><span>TEAM-MAKER</span></div>
        <ul class="mainNav">
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#register" data-toggle="modal" data-target="#myModal">Register</a></li>
            <li><a href="#login" data-toggle="modal" data-target="#loginModal">Login</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </div>
</nav>
<%
    }else{
        String name = (String) session.getAttribute("login_session");
%>
<%--Navbar when user is logged in--%>
<nav>
    <div class="container">
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
<%--Hero Image section--%>
<section class="sec1" id="home"></section>

<%--About Section--%>
<section class="about container" id="about">
    <h2>About</h2>
    <p>Team-Maker is a place to build projects with people like you.
        Post a project idea that people can jump in and help you build with one click, or browse other members and pitch
        them your project ideas.
        So far people have used Team-Maker to build everything from weekend side projects to college projects and
        everything in between.</p>
    <p>Team-Maker: where people interested in the same topic, issue, company or technology can meet one another, share
        their projects, and collaborate.</p>
    <div class="container">
        <div class="row">
            <div class="col-md-4"><i class="material-icons" style="font-size: 100px;">account_circle</i>
                <h2>Register</h2>
                <p class="text-center">Register with team-maker using just your name and email.</p>
            </div>
            <div class="col-md-4"><i class="material-icons" style="font-size: 100px;">search</i>
                <h2>Search</h2>
                <p class="text-center">Search for the ideal team partner for your project using our services.</p>
            </div>
            <div class="col-md-4"><i class="material-icons" style="font-size: 100px;">work</i>
                <h2>Work</h2>
                <p class="text-center">Start working on all the great things you&#39;ve been planning to do.</p>
            </div>
        </div>
    </div>
</section>

<%--Parallax image btw about and contact section--%>
<section class="image3"></section>

<%--Register Modal>--%>
<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Register here to begin</h4>
                </div>
                <div class="modal-body">
                    <form id="register-form" action="/registration" class="register-form" method="post">
                        <div class="form-group">
                            <label for="name">Full Name:</label>
                            <input type="text" class="form-control error" id="name" placeholder="Enter your full name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control error" id="email" placeholder="Enter email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control error" id="pwd" placeholder="Enter password" name="pwd" required>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Confirm Password:</label>
                            <input type="password" class="form-control error" id="cnf_pwd" placeholder="Re-enter password" name="cnf_pwd" required>
                        </div>

                        <input type="submit" class="button5" id="register-btn" value="Register as new user">
                        <a href="#" class="button5" data-toggle="modal" data-target="#loginModal">Already have an account</a>
                    </form>
                </div>
            </div>

        </div>
    </div>

</div>

<%--Login Modal>--%>
<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="loginModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Enter your login details</h4>
                </div>
                <div class="modal-body">
                    <form method="post" action="/login" class="register-form">
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="login-email" placeholder="Enter email" name="login_email" required>
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="login-pwd" placeholder="Enter password" name="login_pwd" required>
                        </div>
                        <input type="submit" class="button5" value="LOGIN"/>
                        <a href="#" class="button5">Forgot Password</a>
                    </form>
                </div>
            </div>

        </div>
    </div>

</div>

<%--Contact Section--%>
<section class="contact container" id="contact">
    <h2>Contact Us</h2>
    <form action="">
        <label for="name">Name:</label>
        <input type="text" id="contact_name">
        <label for="email">Email:</label>
        <input type="text" id="contact_email">
        <label for="message">Message:</label>
        <textarea name="message" id="message"></textarea>
        <button class="button button5">Submit</button>
    </form>
</section>

<%--footer--%>
<div class="footer-basic">
    <footer>

        <div class="footer-logo">TEAM-MAKER</div>

        <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>

        <p class="copyright">&copy; 2018 All Rights Reserved.</p>
    </footer>
</div>

</body>
</html>