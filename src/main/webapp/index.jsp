<html>

<head>
    <link rel="stylesheet" href="mycss/style.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.bundle.js"></script>
    <script src="js/bootstrap.js"></script>
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
        <ul>
            <li><a href="#" class="active">Home</a></li>
            <li><a href="#">Projects</a></li>
            <li><a href="#">People</a></li>
            <li><a href="#">Login</a></li>
            <li><a href="#">Register</a></li>
        </ul>
    </div>
</nav>

<%--Hero Image section--%>
<section class="sec1"></section>

<%--About Section--%>
<section class="about container">
    <h2>About</h2>
    <p>Team-Maker is a place to build projects with people like you.
        Post a project idea that people can jump in and help you build with one click, or browse other members and pitch
        them your project ideas.
        So far people have used Team-Maker to build everything from weekend side projects to college projects and
        everything in between.</p>
    <p>Team-Maker: where people interested in the same topic, issue, company or technology can meet one another, share
        their projects, and collaborate.</p>
</section>

<%--Parallax image btw about and register section--%>
<section class="image3"></section>

<%--Register section--%>
<section class="register">
    <div class="form-style-8">
        <h2>Register for Team-Maker</h2>
        <form>
            <input type="text" name="field1" placeholder="Full Name" />
            <input type="email" name="field2" placeholder="Email" />
            <input type="password" name="field3" placeholder="Password" />
            <input type="password" name="field3" placeholder="Retype Password" />
            <input type="submit" value="Register" />
        </form>
    </div>

    <div class="form-style-8">
        <h2>Login into your account</h2>
        <form>
            <input type="email" name="field2" placeholder="Email" />
            <input type="password" name="field3" placeholder="Password" />
            <input type="submit" value="Login" />
        </form>
    </div>
</section>

<%--Image between Register and Contact section--%>
<section class="image2"></section>

<%--Contact Section--%>
<section class="contact container">
    <h2>Contact Us</h2>
    <form action="">
        <label for="name">Name:</label>
        <input type="text" id="name">
        <label for="email">Email:</label>
        <input type="text" id="email">
        <label for="message">Message:</label>
        <textarea name="message" id="message"></textarea>
        <button class="button button5">Submit</button>
    </form>
</section>
</body>
</html>
