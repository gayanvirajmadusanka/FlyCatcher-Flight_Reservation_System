<jsp:include page="NavBar.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<style>
    body{
        background-image: url(33.jpg);
        background-size: cover;
        background-position: center;
    }

    tbody{
        background: rgba(0, 0, 0, 0.05);
        font-weight: bold;
        text-align: center;


    }
    td{
        text-align: center;
    }
    thead{
        color: white;
        background: rgba(0, 0, 0, 0.7);

    }

</style>
<%

    try {
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");

        //creating the database
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Flycatcher_user", "app", "app");
        PreparedStatement ps = con.prepareStatement("select * from FLIGHT order by flight_no asc");
        ResultSet rs = ps.executeQuery();
%>




<div  style="padding:5% 10% 2% 10% ">
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
                <th>Aircraft No.</th>
                <th>Price</th>



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
                <td><%=rs.getString("aircraft_no")%></td>
                <td><%=rs.getString("price")%></td>

                <td>
                    <a href="FUpdate.jsp?flight_no=<%=rs.getString("flight_no")%>" class="waves-effect -light btn">Edit</a>
                    <a href= "FDelete?flight_no=<%=rs.getString("flight_no")%>" class="waves-effect -light btn" style="margin-left:1%;">Delete</a>
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
<div class="right container" style=" padding-left: 50%; margin-bottom: 1%;">
    <a href="FlightInput.jsp" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
</div>
