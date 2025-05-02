package com.gosjsu.report;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
import javax.servlet.http.HttpServletResponse;

public class ReportGenerator {
    public void generateStudentReport(String studentId, HttpServletResponse response) throws Exception {
        Document doc = new Document();
        PdfWriter.getInstance(doc, response.getOutputStream());
        doc.open();
        // write content...
        doc.close();
    }

    public void generateCourseReport(String courseId, HttpServletResponse response) throws Exception {
        Document doc = new Document();
        PdfWriter.getInstance(doc, response.getOutputStream());
        doc.open();
        // write content...
        doc.close();
    }
}