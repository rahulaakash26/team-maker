<html>

<head>
    <link rel="stylesheet" href="mycss/style.css">
    <script src="myjs/myscript.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
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

    <div class="row">
        <div class="col-sm-4" style="background-color:lavender;">.col-sm-4</div>
        <div class="col-sm-4" style="background-color:lavenderblush;">.col-sm-4</div>
        <div class="col-sm-4" style="background-color:lavender;">.col-sm-4</div>
    </div>

</section>

<%--Parallax image btw about and register section--%>
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
                    <form action="post" class="register-form">
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Confirm Password:</label>
                            <input type="password" class="form-control" id="cnf_pwd" placeholder="Re-enter password" name="cnf_pwd">
                        </div>

                        <button type="submit" class="button5">Register as new User</button>
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
                    <form action="post" class="register-form">
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="login-email" placeholder="Enter email" name="email">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" id="login-pwd" placeholder="Enter password" name="pwd">
                        </div>
                        <button type="submit" class="button5">LOGIN</button>
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
        <input type="text" id="name">
        <label for="email">Email:</label>
        <input type="text" id="contact_email">
        <label for="message">Message:</label>
        <textarea name="message" id="message"></textarea>
        <button class="button button5">Submit</button>
    </form>
</section>
</body>
</html>
</html>