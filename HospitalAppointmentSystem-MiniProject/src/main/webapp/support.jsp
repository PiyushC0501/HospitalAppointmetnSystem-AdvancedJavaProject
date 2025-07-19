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
        <li><a href="doctors.jsp">Doctors</a></li>
        <li><a href="#">Support</a></li>
       </ul>
    </div>

    <div class="support">
          <p>
            <b>Dial 108 Medical Emergency Number</b><br> 108 is a toll-free ambulance
            emergency number in India. Every city or state has this number reserved
            for ambulance services only to make medical emergency care more
            accessible for everyone in India regardless of the income & location of
            the patient. It is currently operational in 23 states for 24×7 medical
            emergencies with a team of fully trained professionals on board. This
            team of technicians and medical staff is well-versed in Basic Life
            Support (BLS) and Advanced Life Support (ALS) equipment to introduce
            necessary Medical Aid while the patient is transported to the hospital.
            Emergency ambulance drivers are also trained to reach the nearest
            hospital in the shortest period.
          </p>

          <p>
            <b>104 Toll-Free Helpline Number for Medical Consultation</b><br> 104
            helpline provides medical assistance for several minor physiological
            illnesses, ailments, and mental distresses, along with directory
            information, details on health schemes, a grievance redressal mechanism,
            and more. Through the early diagnosis of such ailments, they can be
            safely controlled and even cured, before escalating into significant
            health issues. Anyone from any state can dial the 104 helpline number
            and get connected with the advisor or doctor available 24×7.
          </p>

          <p><b>Hospital Emergency Numbers in India</b></p>
          <ul>
             <li>Ambulance emergency number in Andhra Pradesh, Gujarat, Uttarakhand, Goa, Tamil Nadu, Rajasthan, Karnataka, Assam, Meghalaya, MP and UP - 108</li>
                       <li>POLICE - 100</li>
                       <li>National Emergency Number - 112</li>
                        <li>Fire - 101</li>
                       <li> Women Helpline - 1091</li>
                        <li>Air Ambulance - 97 0000 1298</li>
                        <li>Aids Helpline - 1097</li>
                        <li>Railway Enquiry - 139</li>
                        <li>Senior Citizen Helpline - 1091/ 1291</li>
          </ul>
        </div>

</body>
</html>