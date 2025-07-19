<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" 
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

    <div class="search">
        <form action="#">
            <input type="text" placeholder="Search Hospitals"
                   name="search">
            <button>
                <i class="fa fa-search"></i>
            </button>
        </form>
    </div>

    <div class="aside">
       <ul>
        <li><a href="#">Dashboard</a></li>
        <li><a href="fetchAppointments">Appointments</a></li>
        <li><a href="doctors.jsp">Doctors</a></li>
        <li><a href="support.jsp">Support</a></li>
       </ul>
    </div>

    <div class="Selector">
        <div id="State">
        <select id="selector">
            <option value="Maharashtra">Maharashtra</option>
        </select>
       </div>

       <div id="City">
        <select id="selector">
            <option value="Amravati">Amravati</option>
        </select>
       </div>
    </div>

   <div class="hospitals">

    <div class="cards">
        <img src="./images/Hospitals/rims.jpg" alt="" height="250px" width="200px">
        <h3>RIMS Hospital, Amravati</h3>
        <p>Neelam, Besides Hotel, Badnera Road, Amravati, Maharashtra 444605</p>
        <button><a href="rims.jsp">Book Your Appointment</a></button>
    </div>

     <div class="cards">
     <img src="./images/Hospitals/pdmc.jpg" alt="" height="250px" width="200px">
     <h3>PDMMC Hospital,Amravati</h3>
      <p>Panchvati Square, Morshi Rd, Amravati, Maharashtra 444603</p>
      <button><a href="pdmmc.jsp">Book Your Appointment</a></button>
     </div>

     <div class="cards">
     <img src="./images/Hospitals/rdnt.jpg" alt="" height="250px" width="200px">
     <h3>Radiant hospital, Amravati</h3>
     <p>Sabnis Plot, Near, Kalyan Nagar Chowk, Amravati, Maharashtra 444606</p>
     <button><a href="radient.jsp">Book Your Appointment</a></button>
    </div>

    <div class="cards">
        <img src="./images/Hospitals/alinc.jpg" alt="" height="250px" width="200px">
        <h3>ALLIANCE hospital, Amravati</h3>
        <p>Vijay Colony Rd, Rukhmini Nagar, Amravati, Maharashtra 444606</p>
        <button><a href="alliance.jsp">Book Your Appointment</a></button>
       </div>
   </div>


    <script src="script.js"></script>
</body>
</html>