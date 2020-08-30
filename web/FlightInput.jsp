<jsp:include page="NavBar.jsp"></jsp:include>
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

</style>
<div class = "container center" style = "width:30%;margin-top:1%">
    <div class="card" style = "height: 710px; overflow: hidden; padding: 0 8% 0 8%">

        <h4>Add Flight details here</h4>

        <form method="POST" action="FlightServlet">
            <div class="row">
                <div class="col s6 input-feild" >
                    <p>Departure Date</p>
                    <input  placeholder="select from calendar" name="dep_date" type="text" class="datepicker" id="datepicker1" required>                         
                </div>

                <div class="col s6 input-feild">
                    <p>Departure Time</p>
                    <input  placeholder="Ex- 12:30:00" name="dep_time" type="text" class="validate" required> 

                </div>
            </div>


            <div class="container center maker">
                <p style="margin-top:-5px;">Departure Airport</p>

                <input  placeholder="Ex- Katunayake" name="dep_airport" type="text" class="validate"required>                         

            </div>


            <div class="row">
                <div class="col s6 input-feild">
                    <p>Arrival Date</p>

                    <input placeholder="select from calendar" name="arr_date" type="text" class="datepicker" id="datepicker2"required> 

                </div>

                <div class="col s6 input-feild" >
                    <p>Arrival Time</p>

                    <input placeholder="Ex- 13:45:00" name="arr_time" type="text" class="validate" required>                         
                </div>
            </div>
            <div class="container center maker">
                <p style="margin-top:-5px;">Arrival Airport</p>


                <input placeholder="New York" name="arr_airport" type="text" class="validate"  required>                         

            </div>
            <div class="input-feild fly" >
                <p>Aircraft No.</p><br>

                <input  placeholder="Ex-10001" name="aircraft_no" type="text" class="validate" style="width:30%"required>                         
            </div><br>
            <div class="input-feild fly" >
                <p style="margin-top:-10px;"> Price per Head</p><br>

                <input  placeholder="Ex-20000" name="price" type="text" class="validate" style="width:30%"required>                         
            </div><br>

            <button class="btn waves-effect waves-light" type="submit" name="sub">Submit

            </button>
        </form>
    </div>
</div>
</div>
<script>
    $(function () {
        $("#datepicker1, #datepicker2").datepicker({format: 'yyyy-mm-dd'});
    });

</script>
