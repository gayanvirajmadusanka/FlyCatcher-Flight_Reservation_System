<jsp:include page="NavBar.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    String flight_no = request.getParameter("flight_no");
    String dep_date = request.getParameter("dep_date");
    String dep_time = request.getParameter("dep_time");
    String dep_airport = request.getParameter("dep_airport");
    String arr_date = request.getParameter("arr_date");
    String arr_time = request.getParameter("arr_time");
    String arr_airport = request.getParameter("arr_airport");
    String aircraft_no = request.getParameter("aircraft_no");
    String price = request.getParameter("price");

    try {
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");

        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Flycatcher_user", "app", "app");

        PreparedStatement ps = con.prepareStatement("select * from FLIGHT where flight_no=?");
        ps.setString(1, flight_no);

        ResultSet rs = ps.executeQuery();


%>

<style>
    body{
        background-image: url(10.jpg);
        background-size: cover;
    }
    h6, .col{


        color: white;
        transition: all.1s linear;
        padding-bottom: 1%;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.5);


    }
    h6{
        background-color: #29648A;
        font-size: 150%
    }
    p{
        background-color: #2E9CCA;
        font-size: 150%;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.5);

    }

    .col{
        background-color: rgba(0, 0, 0, 0.42);
    }
    .col:hover h6{
        background-color: #D83F87;
        color: white;
        transform: scale(1.05)


    }
    .col:hover p{

        background-color: #f06292;
        transform: scale(1.05)

    }

    h3{
        padding: 1%;
        display: inline-block;

        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.5);

    }



</style>

<div class = "container center" >



    <form method="POST" action="">
        <% while (rs.next()) {%>


        <h3 style="background:#EFA500;">Book your flight</h3><h3 style="color:white; background:#F40058;margin-left: 0.2%">  Flight <%=rs.getString("flight_no")%> </h3> 


        <div class="container center">
            <div class="row">
                <div class="col s4 color">
                    <h6 class="color">Departure Date</h6>
                    <p>  <%=rs.getString("dep_date")%> </p> 

                </div>
                <div class="col s4">
                    <h6>Departure Time</h6>
                    <p>  <%=rs.getString("dep_time")%> </p> 

                </div>
                <div class="col s4">
                    <h6>Departure Airport</h6>
                    <p>  <%=rs.getString("dep_airport")%> </p> 

                </div>
            </div>
        </div>
        <div class="container center">
            <div class="row">
                <div class="col s4">
                    <h6>Arrival Date</h6>
                    <p>  <%=rs.getString("arr_date")%> </p> 

                </div>
                <div class="col s4">
                    <h6>Arrival Time</h6>
                    <p>  <%=rs.getString("arr_time")%> </p> 

                </div>
                <div class="col s4">
                    <h6>Arrival Airport</h6>
                    <p>  <%=rs.getString("arr_airport")%></p> 

                </div></div></div>
        <div class="container center">
            <div class="row">
                <div class="col s4">


                </div>
                <div class="col s4" >
                    <h6>Price per seat</h6>
                    <p>Rs. <%=rs.getString("price")%></p> 

                </div>
                <div class="col s4">

                </div></div></div>



        <div class="input-feild" >

            <h6 style="background:#EFA500;box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.5);display: inline-block; padding: 0.5%;">Enter the number of seats</h6><br>
            <input  name="seat_count"  type="number" class="validate" style="width:4%;background: white; border-radius: 50%; text-align: center; padding: 1%; font-size:150%" required>            
        </div>
        <button class="btn waves-effect waves-light" type="submit" name="fupdate" style="background:#5CDB95;box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.5);">Book Your Flight

        </button>
    </form>
</div>
<%

            String scount = request.getParameter("seat_count");
            int c = Integer.parseInt(scount);

            String s_count = rs.getString("seat_count");
            int d = Integer.parseInt(s_count);

            if (c > d) {

                // RequestDispatcher rd =request.getRequestDispatcher("FlightBooking.jsp");
                //   rd.include(request, response);
                out.println("<div class=\"container center\" style=\"color:white\">"
                        + "seats exceeded"
                        + "</div>");
                break;
            } else if (c <= 0) {
                out.println("<div class=\"container center\" style=\"color:white\">"
                        + "invalid input"
                        + "</div>");

            } else {

                PreparedStatement pt = con.prepareStatement("update Flight set seat_count= seat_count - ? where flight_no=?");

                pt.setString(2, flight_no);
                pt.setString(1, scount);

                int result = pt.executeUpdate();

                if (result > 0) {

                    RequestDispatcher rd = request.getRequestDispatcher("UserFlights.jsp");
                    rd.forward(request, response);
                    break;
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("FlightBooking.jsp");
                    rd.include(request, response);
                    out.println("<div class=\"container center\">"
                            + "Booking Failed"
                            + "</div>");
                    break;

                }

            }

        }

    } catch (Exception e) {

        e.printStackTrace();
        // out.println("wrong");

    }
%>

