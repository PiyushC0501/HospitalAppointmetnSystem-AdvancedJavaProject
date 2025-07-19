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
    response.sendRedirect("login.jsp");
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
        <li><a href="doctors.jsp">Doctors</a></li>
        <li><a href="support.jsp">Support</a></li>
       </ul>
    </div>

    <div class="page-nav">
        <a href="dash.jsp">Dashboard</a> > <a href="#">ALLIANCE</a>
    </div>

    <div class="app-form">
        <form action="appointment" method="POST">
            <input type="hidden" name="hosName" id="hosName" value="ALLIANCE" readonly><br>
            <input type="hidden" name="userid" id="userid" value="<%= userId %>" readonly><br>
    
            <label for="firstname">Patient Details:</label>
            <input type="text" name="firstname" id="firstname" placeholder="Enter Your First Name" required>
            <input type="text" name="lastname" id="lastname" placeholder="Enter Your Last Name" required><br>
    
            <label for="age">Patient Age:</label>
            <input type="number" name="age" id="age" placeholder="Enter the Age" required><br>
    
            <fieldset>
                <legend>Choose your gender:</legend>
                <input type="radio" name="gender" id="male" value="male" required>
                <label for="male">Male</label>
    
                <input type="radio" name="gender" id="female" value="female">
                <label for="female">Female</label>
            </fieldset>
    
            <label for="email">Enter the contact details:</label><br>
            <input type="email" name="email" id="email" placeholder="Enter Your Email" required>
            <input type="number" name="phNo" id="phNo" placeholder="Enter your Phone Number (WhatsApp)" required> 
            <input type="text" name="address" id="address" placeholder="Enter Your Address" required><br>
    
            <label for="day">Appointment:</label><br>
            <input type="date" id="day" name="day" required><br>
    
            <p>Choose the time slot:</p>
            <select id="selector" name="timeslot" required>
                <option value="Morning">Morning</option>
                <option value="Afternoon">Afternoon</option>
                <option value="Evening">Evening</option>
            </select><br><br>
    
            <textarea name="query" id="query" rows="3" placeholder="Enter Your Query Here"></textarea><br>

    
            <button type="submit">Submit</button>
        </form>
       </div>

</body>
</html>