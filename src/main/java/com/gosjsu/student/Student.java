package com.gosjsu.student;

import java.util.Date;

public class Student {
    private int id;
    private String studentId;
    private String firstName;
    private String lastName;
    private String email;
    private String major;
    private String gender;
    private Date dateOfBirth;
    private String city;
    private String postalAddress;
    private String mobileNumber;
    private String alternateMobileNumber;

    public Student() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
    
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    
    public String getPostalAddress() {
        return postalAddress;
    }

    public void setPostalAddress(String postalAddress) {
        this.postalAddress = postalAddress;
    }
    
    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }
    
    public String getAlternateMobileNumber() {
        return alternateMobileNumber;
    }

    public void setAlternateMobileNumber(String alternateMobileNumber) {
        this.alternateMobileNumber = alternateMobileNumber;
    }

    // Helper method to get full name
    public String getName() {
        return firstName + " " + lastName;
    }

    public void setName(String name) {
        if (name != null && name.contains(" ")) {
            String[] parts = name.split(" ", 2);
            this.firstName = parts[0];
            this.lastName = parts[1];
        }
    }
} 