package com.gosjsu.shared;

public class StudentGradeDTO {
    private String studentId;
    private String firstName;
    private String lastName;
    private String courseId;
    private String courseName; // Added courseName field
    private String grade;

    // Getters and Setters
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

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) { // Add setter for courseName
        this.courseName = courseName;
    }
}