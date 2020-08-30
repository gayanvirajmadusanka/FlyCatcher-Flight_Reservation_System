<jsp:include page="NavBar.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%

    try {
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");

        //creating the database
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Flycatcher_user", "app", "app");
        PreparedStatement ps = con.prepareStatement("select * from FLIGHT order by flight_no asc");
        ResultSet rs = ps.executeQuery();
%>

<style>
    body{
        background-image: url(11.jpg);
        background-size: cover;


    }
    td{
        text-align:center;
        font-weight: bold;
    }
    tbody{
        background: rgba(255, 255, 255, 0.7)


    }
    thead{
        color: white;
        background: rgba(0, 0, 0, 0.2)
    }

</style>


<div style="padding:2% 10% ">
    <table>
        <thead>
            <tr>
                <th>Flight No.</th>
                <th>Departure Date</th>
                <th>Departure Time</th>
                <th>Departure Airport</th>
                <th>Arrival Date</th>
                <th>Arrival Time</th>
                <th>Arrival Airport</th>

                <th>Price</th>
                <th>Seats Available</th>



            </tr>
        </thead>
        <tbody>
            <%while (rs.next()) {%>
            <tr>
                <td><%=rs.getString("flight_no")%></td>
                <td><%=rs.getString("dep_date")%></td>
                <td><%=rs.getString("dep_time")%></td>
                <td><%=rs.getString("dep_airport")%></td>
                <td><%=rs.getString("arr_date")%></td>
                <td><%=rs.getString("arr_time")%></td>
                <td><%=rs.getString("arr_airport")%></td>

                <td><%=rs.getString("price")%></td>
                <td ><%=rs.getString("seat_count")%></td>

                <td>
                    <%
                        String scount = rs.getString("seat_count");
                        int s_count = Integer.parseInt(scount);

                        if (s_count == 0) {


                    %>
                    <a class="waves-effect -light btn disabled">All seats Booked</a>
                    <%                   } else {%>
                    <a href="FlightBooking.jsp?flight_no=<%=rs.getString("flight_no")%>" class="waves-effect -light btn">Book Flight</a>
                    <% }

                    %>
                </td>


            </tr>

            <%}%>
        </tbody>
    </table>
</div>
<%} catch (Exception e) {

        e.printStackTrace();

    }
%>
