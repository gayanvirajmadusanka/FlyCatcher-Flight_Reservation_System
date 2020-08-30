<jsp:include page="NavBar.jsp"></jsp:include>
<style>
    body{
        background-image: url(30.jpg);
        background-size: cover;

    }
    .card{
        background-color: white;
        background-size:cover;
        box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.5);
        border-radius: 7px 7px 7px 7px;
        border:5px solid black;

    }


</style>
<div class = "container center" style = "width:30%;margin-top:3%">
    <div class="card" style = "height: 470px;width:400px; overflow: hidden; ">
        <div class = "container center" style=" width: 80%">
            <h3>Admin Login</h3>
            <form method="POST" action="NewServlet1">
                <div class="input-feild">
                    <i class="material-icons prefix">person</i>
                    <input placeholder="Email" name="admin_email" type="text" class="validate" required> 

                </div><br>
                <div class="input-feild" >
                    <i class="material-icons prefix">lock</i>
                    <input placeholder="Password" name="admin_password" type="password" class="validate" required>                         
                </div><br>
                <button class="btn waves-effect waves-light" type="submit" name="ALogin">Login

                </button>
            </form>
        </div>
    </div></div>
