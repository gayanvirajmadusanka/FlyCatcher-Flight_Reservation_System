<jsp:include page="NavBar.jsp"></jsp:include>
<div class = "container center" style = "width:30%">
    <h3>Registration</h3>

    <form method="POST" action="RegistrationServlet">
        <div class="input-feild">
            <i class="material-icons prefix">person</i>
            <input placeholder="Name" name="name" type="text" class="validate" required> 

        </div><br>
        <div class="input-feild" >
            <i class="material-icons prefix">mail</i>
            <input placeholder="Email" name="email" type="text" class="validate" required>                         
        </div><br>
        <div class="input-feild" >
            <i class="material-icons prefix">phone</i>
            <input placeholder="Phone" name="phone" type="text" class="validate" required>                         
        </div><br>
        <div class="input-feild" >
            <i class="material-icons prefix">lock</i>
            <input placeholder="Password" name="password" type="text" class="validate" required>                         
        </div><br>
        <button class="btn waves-effect waves-light" type="submit" name="Ureg">Register

        </button>
    </form>
</div>
