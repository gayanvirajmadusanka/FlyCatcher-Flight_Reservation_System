<jsp:include page="NavBar.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String reg_no = request.getParameter("reg_no");
    String seat_count = request.getParameter("seat_count");
    try {
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");

        //creating the database
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Flycatcher_user", "app", "app");

        PreparedStatement ps = con.prepareStatement("select * from AIRCRAFT where reg_no=?");
        ps.setString(1, reg_no);

        ResultSet rs = ps.executeQuery();


%>

<style>
    body{
        background-image: url(34.jpg);

        background-position: left;
        background-size: cover;
    }

    input{
        text-align: center;
    }
    .card{
        border:5px double black;
        box-shadow: 5px 5px 5px  rgba(1, 0, 0, 0.35);


    }
</style>
<div class = "container center" style = "width:20%;margin-top:1%">
    <div class="card" style = "height: 450px; overflow: hidden; padding: 0 8% 0 8%">

        <h4 style="margin-bottom: 5%">Edit Aircraft</h4>


        <form method="POST" action="">
            <% while (rs.next()) {%>

            <div class="input-feild">
                <h4>Registration No - <%=rs.getString("reg_no")%></h4>

            </div><br>
            <div class="input-feild" >
                <p>Seat Count</p>
                <input  name="seat_count" value= "<%=rs.getString("seat_count")%>" type="text" class="validate">                         
            </div><br>
            <%}%>

            <button class="btn waves-effect waves-light" type="submit" name="Aupdate">Update

            </button>
        </form>
    </div>
</div>
<%
        if (reg_no != null && seat_count != null) {
            String query = "update AIRCRAFT set seat_count= ? where reg_no= ?";
            PreparedStatement pc = con.prepareStatement(query);
            pc.setString(1, seat_count);
            pc.setString(2, reg_no);

            int result = pc.executeUpdate();

            if (result > 0) {

                RequestDispatcher rc = request.getRequestDispatcher("AirCraft.jsp");
                rc.forward(request, response);
            } else {
                RequestDispatcher rc = request.getRequestDispatcher("AirCraft.jsp");
                rc.include(request, response);
                out.println("<div class=\"container center\">"
                        + "Deletion Failed"
                        + "</div>");
            }
        }

    } catch (Exception e) {

        e.printStackTrace();
        out.println("wrong");

    }
%>
