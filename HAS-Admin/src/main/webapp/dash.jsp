<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page isELIgnored="false" %>

<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("hosName") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    String hosName = (String) session1.getAttribute("hosName");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="CSS/dashb.css">
</head>
<body>

<div class="wrapper">
    <div class="header">
        <div class="dash_heading">
            <h2>Dashboard</h2>
            <p>Welcome to <%= hosName %> Hospital!</p>
        </div>
        <div class="logout">
            <a href="logout">Logout</a>
        </div>
    </div>
<div class="appt">

    <h2>Appointments for Hospital: ${sessionScope.hosName}</h2>

<div class="item">

    <table border="1" cellspacing="0" cellpadding="5">
       <thead>
           <tr>
               <th>ID</th>
               <th>Firstname</th>
               <th>Lastname</th>
               <th>Age</th>
               <th>Gender</th>
               <th>Email</th>
               <th>Phone</th>
               <th>Address</th>
               <th>Day</th>
               <th>Time Slot</th>
               <th>Query</th>
               <th>Status</th>
               <th>Change Status</th> <!-- New column -->
           </tr>
       </thead>
       <tbody>
           <c:forEach var="appt" items="${appointments}">
               <tr>
                   <td>${appt.id}</td>
                   <td>${appt.firstname}</td>
                   <td>${appt.lastname}</td>
                   <td>${appt.age}</td>
                   <td>${appt.gender}</td>
                   <td>${appt.email}</td>
                   <td>${appt.phNo}</td>
                   <td>${appt.address}</td>
                   <td>${appt.day}</td>
                   <td>${appt.timeslot}</td>
                   <td>${appt.query}</td>
                   <td>${appt.status}</td>
                   <td>
                       <c:choose>
                           <c:when test="${appt.status eq 'Not Responded'}">
                               <form action="updateStatus" method="post">
                                   <input type="hidden" name="id" value="${appt.id}" />
                                   <select name="status">
                                       <option value="Confirmed">Confirm</option>
                                       <option value="Rescheduled">Rescheduled</option>
                                       <option value="Cancelled">Cancel</option>
                                   </select>
                                   <button type="submit">Update</button>
                               </form>
                           </c:when>
                           <c:otherwise>
                               <span style="color: gray;">Already Updated</span>
                           </c:otherwise>
                       </c:choose>
                   </td>
               </tr>
           </c:forEach>
       </tbody>
    </table>
</div>
</div>

</div>

</body>
</html>
