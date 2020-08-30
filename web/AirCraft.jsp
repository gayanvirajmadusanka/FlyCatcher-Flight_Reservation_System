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
        PreparedStatement ps = con.prepareStatement("select * from AIRCRAFT order by reg_no asc");
        ResultSet rs = ps.executeQuery();
%>


<style>
    body{
        background-image: url(34.jpg);

        background-position: left;
        background-size: cover;
    }
    tbody{
        background: rgba(255, 255, 255, 0.5);
        font-weight: bold;
        text-align: center;


    }
    th, td{
        text-align: center;
    }
    thead{
        color: white;
        background: rgba(0, 0, 0, 0.7);

    }



</style>

<div class="container center" style="padding-top:2%; width: 40%">
    <table>
        <thead>
            <tr>
                <th>Registration No.</th>
                <th>Seat Count</th>

            </tr>
        </thead>
        <tbody>
            <%while (rs.next()) {%>
            <tr>
                <td><%=rs.getString("reg_no")%></td>
                <td><%=rs.getString("seat_count")%></td>
                <td>
                    <a href="AUpdate.jsp?reg_no=<%=rs.getString("reg_no")%>" class="waves-effect -light btn">Edit</a>
                    <a href= "ADelete?reg_no=<%=rs.getString("reg_no")%>" class="waves-effect -light btn" style="margin-left:1%;">Delete</a>
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
<div class="right container" style="padding-top: 2%; padding-left: 50%; margin-bottom: 1%;">
    <a href="AircraftInput.jsp" class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
</div>
