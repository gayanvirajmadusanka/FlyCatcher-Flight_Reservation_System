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
        background-image: url(33.jpg);

        background-position: center;
    }
    input{
        text-align: center;

    }
    h4{
        padding: 1%;
        display: inline-block;
        background-color: #ffdc6a;
        padding: 3%;
        border-radius: 7px 7px 7px 7px;
        box-shadow: 2px 2px 2px  rgba(1, 0, 0, 0.5);

    }

    p{
        background-color: #a6dcef;
        margin-bottom:-5px;
        display: inline-block;
        padding: 0.7% 10% 0.7% 10%;
        box-shadow: 2px 3px 2px  rgba(0, 0, 0, 0.3);
        border-radius: 3px 3px 3px 3px;
        transition: 0.3s;
    }

    .col:hover p{
        color:white;
        background-color: #111d5e;
        transform: scale(1.1);

        box-shadow: 2px 3px 2px  rgba(0, 0, 0, 0.3);
        border-radius: 3px 3px 3px 3px;
    }
    .maker:hover p{
        color:white;
        background-color: #111d5e;
        transform: scale(1.1);
        border-radius: 3px 3px 3px 3px;
        box-shadow: 2px 3px 2px  rgba(0, 0, 0, 0.3);
    }
    .fly:hover p{
        color:white;
        background-color: #111d5e;
        transform: scale(1.1);
        border-radius: 3px 3px 3px 3px;
        box-shadow: 2px 3px 2px  rgba(0, 0, 0, 0.3);
    }
    .card{
        border:2.5px solid black;
    }

</style>
<div class = "container center" style = "width:30%;margin-top:1%">
    <div class="card" style = "height: 800px; overflow: hidden; padding: 0 8% 0 8%">

        <h4>Edit Flight</h4>


        <form method="POST" action="">
            <% while (rs.next()) {%>

            <div style="text-align:center">
                <h5> Flight -<%=rs.getString("flight_no")%></h5> 

            </div><br>

            <div class="row">

                <div class="col s6 input-feild" >
                    <p>Departure Date</p>
                    <input  name="dep_date" value= "<%=rs.getString("dep_date")%>" type="text" class="datepicker"id="datepicker1" required>                         
                </div>


                <div class="col s6 input-feild">
                    <p>Departure Date</p>
                    <input  value= "<%=rs.getString("dep_time")%>" name="dep_time" type="text" class="validate" required/> 
                </div>
            </div>
            <div class="container center maker">
                <div class="input-feild" >
                    <p style="margin-top:-5px;">Departure Airport</p>
                    <input  name="dep_airport" value= "<%=rs.getString("dep_airport")%>" type="text" class="validate">                         
                </div>
            </div>



            <div class="row">

                <div class="col s6 input-feild">
                    <p>Arrival Date</p>
                    <input  value= "<%=rs.getString("arr_date")%>" name="arr_date" type="text" class="datepicker" id="datepicker2" required/> 

                </div>


                <div class="col s6 input-feild" >
                    <p>Arrival Time</p>
                    <input  name="arr_time" value= "<%=rs.getString("arr_time")%>" type="text" class="validate" required>                         
                </div>
            </div>
            <div class="container center maker">
                <div class="input-feild">
                    <p style="margin-top:-5px;">Arrival Airport</p>
                    <input  value= "<%=rs.getString("arr_airport")%>" name="arr_airport" type="text" class="validate" required/> 

                </div>
            </div>





            <div class="input-feild fly">
                <p>Aircraft No.</p><br>
                <input  value= "<%=rs.getString("aircraft_no")%>" name="aircraft_no" type="text" class="validate" required/> 

            </div>


            <div class="input-feild fly" >
                <p style="margin-top:15px;"> Price per Head</p><br>

                <input  name="price" value= "<%=rs.getString("price")%>" type="text" class="validate" required>                         
            </div>


            <%}%>

            <button class="btn waves-effect waves-light" type="submit" name="Fupdate">Update

            </button>
        </form>
    </div>
</div>

<%
        if (flight_no != null && dep_date != null && dep_time != null && dep_airport != null && arr_date != null && arr_time != null && arr_airport != null && aircraft_no != null && price != null) {
            String query = "update FLIGHT set dep_date=?, dep_time=?, dep_airport=?, arr_date=?, arr_time=?, arr_airport=?, aircraft_no=?, price=?, seat_count=(SELECT seat_count FROM AIRCRAFT  where reg_no = ?) where flight_no=?";
            PreparedStatement pc = con.prepareStatement(query);

            pc.setString(1, dep_date);
            pc.setString(2, dep_time);
            pc.setString(3, dep_airport);
            pc.setString(4, arr_date);
            pc.setString(5, arr_time);
            pc.setString(6, arr_airport);
            pc.setString(7, aircraft_no);
            pc.setString(8, price);
            pc.setString(9, aircraft_no);
            pc.setString(10, flight_no);

            int result = pc.executeUpdate();

            if (result > 0) {

                RequestDispatcher rc = request.getRequestDispatcher("Flights.jsp");
                rc.forward(request, response);
            } else {
                RequestDispatcher rc = request.getRequestDispatcher("Flights.jsp");
                rc.include(request, response);
                out.println("<div class=\"container center\">"
                        + "Update Failed"
                        + "</div>");
            }
        }

    } catch (Exception e) {

        e.printStackTrace();
        out.println("<div class=\"container center\">"
                + "Aircraft Doesn't exist"
                + "</div>");

    }
%>
<script>
    $(function () {
        $("#datepicker1, #datepicker2").datepicker({format: 'yyyy-mm-dd'});
    });

</script>
