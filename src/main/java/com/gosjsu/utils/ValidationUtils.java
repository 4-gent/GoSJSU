package com.gosjsu.utils;

import java.util.regex.Pattern;

public class ValidationUtils {

    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^\\+?[0-9. ()-]{7,}$");

    public static boolean isValidEmail(String email) {
        return email != null && EMAIL_PATTERN.matcher(email).matches();
    }

    public static boolean isValidPhone(String phone) {
        return phone != null && PHONE_PATTERN.matcher(phone).matches();
    }

    public static boolean isNotEmpty(String input) {
        return input != null && !input.trim().isEmpty();
    }

    public static boolean isValidStudentId(String studentId) {
        return studentId != null && studentId.matches("^[0-9]{8}$"); // Assuming student ID is 8 digits
    }

    public static boolean isValidCourseId(String courseId) {
        return courseId != null && courseId.matches("^[A-Z]{3}[0-9]{3}$"); // Assuming course ID format is ABC123
    }
}