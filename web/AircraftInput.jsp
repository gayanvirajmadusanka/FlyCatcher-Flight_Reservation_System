<jsp:include page="NavBar.jsp"></jsp:include>

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

        <h4 style="margin-bottom: 5%">Add Aircraft</h4>

        <form method="POST" action="AircraftServlet">
            <div class="input-feild">
                <p style="padding-top: 4%">Registration No.</p>
                <input placeholder="Ex-10001" name="reg_no" type="number" min="10000" max="99999" class="validate" required> 

            </div><br>
            <div class="input-feild" >
                <p >Seat count</p>
                <input placeholder="Enter number of seats in aircraft" name="seat_count" type="text" class="validate" required>                         
            </div><br>

            <button class="btn waves-effect waves-light" type="submit" name="Ureg">Register

            </button>
        </form>
    </div>
</div>