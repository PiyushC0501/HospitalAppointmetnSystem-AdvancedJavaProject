package com.servlet.appModel;

public class Appointment {
    private String userId; // NOT int
    private int id;
    private String hosName;
    private String firstname;
    private String lastname;
    private int age;
    private String gender;
    private String email;
    private String phNo;
    private String address;
    private String day;
    private String timeslot;
    private String query;
    private String status;

    // Getters and setters for all fields

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getHosName() { return hosName; }
    public void setHosName(String hosName) { this.hosName = hosName; }

    public String getFirstname() { return firstname; }
    public void setFirstname(String firstname) { this.firstname = firstname; }

    public String getLastname() { return lastname; }
    public void setLastname(String lastname) { this.lastname = lastname; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhNo() { return phNo; }
    public void setPhNo(String phNo) { this.phNo = phNo; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getDay() { return day; }
    public void setDay(String day) { this.day = day; }

    public String getTimeslot() { return timeslot; }
    public void setTimeslot(String timeslot) { this.timeslot = timeslot; }

    public String getQuery() { return query; }
    public void setQuery(String query) { this.query = query; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
}

