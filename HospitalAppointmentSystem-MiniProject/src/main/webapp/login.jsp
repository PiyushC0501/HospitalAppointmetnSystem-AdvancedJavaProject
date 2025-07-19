<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./CSS/login.css">
</head>

<body>
<div class="main-container">


     <%
                        String message = request.getParameter("msg");
                        if (message != null) {
                        %>
                            <p class="regmessage" style="text-align:center; position:absolute; left:50px; top:22px;"><b><%= message %></b></p>
                        <%
                        }

                        String error = request.getParameter("error");
                        if ("1".equals(error)) {
                        %>
                            <p class="regmessage" style="text-align:center; position:absolute; left:80px; top:80px;"> ❌ Invalid username or password. Please try again.</p>
                        <%
                        }
     %>

    <div class="btns-container">
        <a href="#" class="btn login">LOG IN</a>
        <a href="#" class="btn Register">REGISTER</a>
    </div>



    <div class="login-container">

        <form action="login" method="post">
            <div class="input">
                <input type="text" name="username" id="username" placeholder="Enter Username:">
            </div>

            <div class="input">
                <input type="password" name="password" id="password" placeholder="Password">

                <div class="remember">
                    <input type="checkbox" id="Remember">
                    <label for="Remember">Remember me</label>
                </div>
                <div class="login-btn">
                    <a><button type="submit">Login</button></a>
                </div>
            </div>
        </form>
        <p class="bottom-login">Don't have an account ? <a href="#">TRY REGISTER</a> </p>

    </div>





    <div class="register-container">
    
        <form action="register" method="post">
            <div class="input ">
                <input id="username" type="text" name="username" placeholder="Username">
            </div>

            <div class="input ">
                <input id="email" type="email" name="email" placeholder="Email">
            </div>

            <div class="input">
                <input id="password" type="password" name="password" placeholder="Password">
            </div>

            <div class="input">
                <input type="password" name="cnfpassword" id="CnfPassword" placeholder="Confirm Password">
            </div>

            <div class="login-btn">
                <a id="register-btn"> <button type="submit">REGISTER</button></a>
            </div>
        </form>
<!--
        <p class="bottom-register">Already have an account ? <a href="#">TRY LOG IN</a></p>
-->
    </div>

</div>

<script src="./JS/login.js">
</script>


</body>
</html> 