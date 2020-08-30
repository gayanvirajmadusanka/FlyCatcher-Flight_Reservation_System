<html>
    <head>
        <title>Fly Catcher</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>


        <ul id="dropdown1" class="dropdown-content">
            <li><a href="UserLogin.jsp" class="modal-trigger">as User</a></li>
            <li><a href="AdminLogin.jsp" class="modal-trigger">as Admin</a></li>
        </ul>


        <div class="navbar-fixed">
            <nav style="background-color: #44378D">
                <div class="container nav-wrapper" style = "width:100%">
                    <a href="index.jsp" class="brand-logo">FlyCatcher</a>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Login</a></li>
                        <li><a href="Register.jsp">Register</a></li>
                    </ul>
                </div>
            </nav>
        </div>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="main.js"></script>



    </body>
</html>