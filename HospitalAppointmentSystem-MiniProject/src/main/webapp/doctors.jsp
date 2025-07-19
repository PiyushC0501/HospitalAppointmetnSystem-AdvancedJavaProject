<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" 
    href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./CSS/dashboard.css">
</head>
<body>
<%
String userId = (String) session.getAttribute("userId");
String username = (String) session.getAttribute("username");
String email = (String) session.getAttribute("email");

if (userId == null || username == null) {
    response.sendRedirect("index.jsp");
}
%>
    <div class="nav">
        <ul>
            <li><a href="">Dashboard</a></li>
        </ul>
        <div class="user-name"><li>Welcome, <%= username %></li></div>
        
        <div class="login-btn">
            <a href="logout">Logout</a>
        </div>
    </div>
    

    <div class="aside">
       <ul>
        <li><a href="dash.jsp">Dashboard</a></li>
        <li><a href="fetchAppointments">Appointments</a></li>
        <li><a href="#">Doctors</a></li>
        <li><a href="support.jsp">Support</a></li>
       </ul>
    </div>

    <div class="doctors">
            <h3>You can Consult and Book Online Video Call Appointment</h3>
           <h3>This Service is not Live..!</h3>
    </div>

    <script src="script.js"></script>
</body>
</html>