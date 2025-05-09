package com.gosjsu.student;

public class Course {
    private int courseId; // courseID
    private String courseName; // Course name

    // Getters and Setters
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int id) {
        this.courseId = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String name) {
        this.courseName = name;
    }
}