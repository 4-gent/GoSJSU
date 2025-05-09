package com.gosjsu.student;

import com.gosjsu.shared.Grade;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

/**
 * Utility class for calculating GPA based on letter grades
 */
public class GPACalculator {
    
    // Standard GPA points mapping (can be customized per institution)
    private static final Map<String, Double> gradePoints = new HashMap<>();
    
    static {
        gradePoints.put("A+", 4.0);
        gradePoints.put("A", 4.0);
        gradePoints.put("A-", 3.7);
        gradePoints.put("B+", 3.3);
        gradePoints.put("B", 3.0);
        gradePoints.put("B-", 2.7);
        gradePoints.put("C+", 2.3);
        gradePoints.put("C", 2.0);
        gradePoints.put("C-", 1.7);
        gradePoints.put("D+", 1.3);
        gradePoints.put("D", 1.0);
        gradePoints.put("D-", 0.7);
        gradePoints.put("F", 0.0);
    }
    
    /**
     * Calculate GPA from a list of grades
     * @param grades List of Grade objects
     * @return calculated GPA as a double with 2 decimal places
     */
    public static double calculateGPA(List<Grade> grades) {
        if (grades == null || grades.isEmpty()) {
            return 0.0;
        }
        
        double totalPoints = 0.0;
        int totalCourses = 0;
        
        for (Grade grade : grades) {
            String letterGrade = grade.getGrade();
            if (letterGrade != null && !letterGrade.isEmpty()) {
                // Look up the grade point value
                Double points = gradePoints.get(letterGrade.trim().toUpperCase());
                if (points != null) {
                    totalPoints += points;
                    totalCourses++;
                }
            }
        }
        
        // Avoid division by zero
        if (totalCourses == 0) {
            return 0.0;
        }
        
        // Calculate and round to 2 decimal places
        double gpa = totalPoints / totalCourses;
        return Math.round(gpa * 100.0) / 100.0;
    }
    
    /**
     * Calculate GPA for a specific semester
     * @param grades List of Grade objects
     * @param semester Semester to filter by (e.g. "Fall 2025")
     * @return calculated GPA for the semester
     */
    public static double calculateSemesterGPA(List<Grade> grades, String semester) {
        if (grades == null || grades.isEmpty() || semester == null || semester.isEmpty()) {
            return 0.0;
        }
        
        double totalPoints = 0.0;
        int totalCourses = 0;
        
        for (Grade grade : grades) {
            if (semester.equals(grade.getSemester())) {
                String letterGrade = grade.getGrade();
                if (letterGrade != null && !letterGrade.isEmpty()) {
                    Double points = gradePoints.get(letterGrade.trim().toUpperCase());
                    if (points != null) {
                        totalPoints += points;
                        totalCourses++;
                    }
                }
            }
        }
        
        if (totalCourses == 0) {
            return 0.0;
        }
        
        double gpa = totalPoints / totalCourses;
        return Math.round(gpa * 100.0) / 100.0;
    }
} 