
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp"></jsp:include>


    <div class="slider" >
        <ul class="slides" >
            <li>
                <img src="38.jpg"> <!-- random image -->
                <div class="caption left-align">
                    <h3 style="color:black">Why waste time in queues</h3>
                    <h5 style="color:black;">To buy tickets?</h5>

                </div>
            </li>
            <li>
                <img src="39.jpg" style="padding-top:38%"> <!-- random image -->
                <div class="caption right-align">
                    <h3 style="color:black">When you can book tickets</h3>
                    <h5 style="color:black">with just a few clicks</h5>
                </div>
            </li>
            <li>
                <img style="padding-top:32%" src="36.jpg"> <!-- random image -->
                <div class="caption left-align">
                    <h3>You will be there</h3>
                    <h5 class="light grey-text text-lighten-3">Before you know it</h5>
                </div>
            </li>
            <li style="background-color: #e57373">
                <!-- random image -->
                <div class="caption center-align">
                    <h1>FlyCatcher</h1>
                    <h5 class="light grey-text text-lighten-3">Catch your flight at home</h5>
                    <div class="col s6">
                        <a href="UserLogin.jsp" class="waves-effect -light btn">Book your flight now</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>

    <div class="container" style="padding-top: 5%">
        <div class="row">
            <div class="col s4">
                <!-- Promo Content 1 goes here -->
                <div class="center">
                    <i class="large material-icons" style="color: #EE6E73">compare</i>
                    <p>Compare</p>
                    <p class="light center">FlyCatcher gives you the opportunity to compare different kinds of flights to the same destination under one platform </p>
                </div>
            </div>
            <div class="col s4">
                <!-- Promo Content 1 goes here -->
                <div class="center">
                    <i class="large material-icons" style="color: orange">flight</i>
                    <p>Book</p>
                    <p class="light center">Make your bookings with a single push of a button</p>
                </div>
            </div>
            <div class="col s4">
                <!-- Promo Content 1 goes here -->
                <div class="center">
                    <i class="large material-icons" style="color: blue">work</i>
                    <p>Travel</p>
                    <p class="light center">Travel with ease for the best and affordable prices</p>
                </div>
            </div>
        </div>

    </div>





    <script>
        $(document).ready(function () {
            $('.slider').slider({full_width: true});
        });


    </script>
<jsp:include page="Footer.jsp"></jsp:include>