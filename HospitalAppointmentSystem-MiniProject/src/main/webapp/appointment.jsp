<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>

<%
    String userId = (String) session.getAttribute("userId");
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");

    if (userId == null || username == null) {
        response.sendRedirect("index.jsp");
        return; // Prevent further processing
    }
%>

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

    <div class="nav">
        <ul>
            <li><a href="dash.jsp">Dashboard</a></li>
        </ul>
        <div class="user-name">
            <li>Welcome, <%= username %></li>
        </div>
        <div class="login-btn">
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="aside">
        <ul>
            <li><a href="dash.jsp">Dashboard</a></li>
            <li><a href="#">Appointments</a></li>
            <li><a href="doctors.jsp">Doctors</a></li>
            <li><a href="support.jsp">Support</a></li>
        </ul>
    </div>

    <div class="appt-status">
        <table>
            <thead>
                <tr>
                    <th>firstname</th>
                    <th>lastname</th>
                    <th>age</th>
                    <th>gender</th>
                    <th>hosName</th>
                    <th>day</th>
                    <th>timeslot</th>
                    <th>status</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="a" items="${appointments}">
                    <tr>
                        <td>${a.firstname}</td>
                        <td>${a.lastname}</td>
                        <td>${a.age}</td>
                        <td>${a.gender}</td>
                        <td>${a.hosName}</td>
                        <td>${a.day}</td>
                        <td>${a.timeslot}</td>
                        <td>${a.status}</td>
                        <td>
                            <form action="deleteAppointment" method="post"
                                  onsubmit="return confirm('Are you sure you want to delete this appointment?');">
                                <input type="hidden" name="apptId" value="${a.id}" />
                                <button type="submit" class="delete-btn">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="script.js"></script>
</body>
</html>
