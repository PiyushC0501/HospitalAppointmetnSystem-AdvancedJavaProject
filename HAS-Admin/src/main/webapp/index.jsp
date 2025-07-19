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
    <link rel="stylesheet" href="CSS/style.css">
</head>

<body>
    <div class="main-container">
          

        <h3 style="text-align: center;">Welcome to Admin Portal..!</h3>
        <form action="login" method="post">
        <div class="login-container">
            <div class="input">
                <input type="text" id="hosName" name="hosName" placeholder="Enter Hospital Name">
            </div>
    
            <div class="input">
                <input type="password" id="password" name="password" placeholder="Password">
            </div>
                
            <div class="login-btn">
                <a><button type="submit">LOG IN</button></a>
            </div>
        </div>
    </form>

        <%
             String error = request.getParameter("error");
             String message = request.getParameter("message");

            if(request.getParameter("error") != null){
                out.println("<p style='color:black;text-align:center;'><b>Invalid username or password. Try Again!</b></p>");
            }

            if ("logout_success".equals(message)) {
                        out.println("<p style='color:green;text-align:center;'><b>Logout Successful!</b></p>");
            }
        %>

    </div>

</body>
</html> 