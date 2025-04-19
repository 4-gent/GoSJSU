package com.gosjsu.report;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class ReportGenerator {

    public void generatePDFReport(List<String> reportData, HttpServletResponse response) throws DocumentException, IOException {
        Document document = new Document();
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"report.pdf\"");
        
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();
        
        for (String data : reportData) {
            document.add(new Paragraph(data));
        }
        
        document.close();
    }

    public void generateCSVReport(List<String> reportData, HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"report.csv\"");
        
        FileOutputStream outputStream = new FileOutputStream(response.getOutputStream());
        for (String data : reportData) {
            outputStream.write((data + "\n").getBytes());
        }
        outputStream.flush();
        outputStream.close();
    }
}