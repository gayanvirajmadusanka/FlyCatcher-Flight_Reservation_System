<jsp:include page="NavBar.jsp"></jsp:include>
<style>
    body{
        background-image: url(20.jpg);
        background-size: cover;
        background-position-x: 35%;
    }
    .card{
        background-color: #ffdefc;
        background-size:cover;
        box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.5);
        border-radius: 7px 7px 7px 7px;
        border: 10px solid purple;
    }
    .validate{
        color: black;
    }
    h3{
        padding: 1%;
        display: inline-block;
        background-color: #ffdc6a;
        padding: 3%;
        border-radius: 7px 7px 7px 7px;
        box-shadow: 3px 5px 5px  rgba(1, 0, 0, 0.5);

    }
</style>
<div class = "container center" style = "width:30%;margin-top:3%">
    <div class="card" style = "height: 470px;width:400px; overflow: hidden; ">
        <div class = "container center" style=" width: 80%">
            <h3>User Login</h3>
            <form method="POST" action="UserServlet">
                <div class="input-feild">
                    <i class="material-icons prefix">person</i>
                    <input placeholder="Email" name="user_email" type="text" class="validate" required> 

                </div><br>
                <div class="input-feild" >
                    <i class="material-icons prefix">lock</i>
                    <input placeholder="Password" name="user_password" type="password" class="validate" required>                         
                </div><br>
                <button class="btn waves-effect waves-light" type="submit" name="ULogin">Login

                </button><br>
                <h6> New to fly catcher?</h6><br>
                <a href="Register.jsp">Create new account</a>
            </form>
        </div>
    </div>
</div>

