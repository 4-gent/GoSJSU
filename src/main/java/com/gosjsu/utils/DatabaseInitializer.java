package com.gosjsu.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.stream.Collectors;

@WebListener
public class DatabaseInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Initializing database...");
        try {
            // Make sure MySQL driver is loaded
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // First, create the database if it doesn't exist
            createDatabaseIfNotExists();
            
            // Execute schema script
            executeSchemaScript();
            
            // Execute init script
            executeInitScript();
            
            System.out.println("Database initialization complete");
        } catch (Exception e) {
            System.err.println("Error initializing database: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Not needed for this example
    }

    private void createDatabaseIfNotExists() throws SQLException {
        // Connect without specifying database name
        String url = "jdbc:mysql://localhost:3306";
        String user = "root";
        String password = "password";
        
        try (Connection connection = DriverManager.getConnection(url, user, password);
             Statement statement = connection.createStatement()) {
            // Create the database if it doesn't exist
            statement.executeUpdate("CREATE DATABASE IF NOT EXISTS gosjsu");
            System.out.println("Database gosjsu created or already exists");
        }
    }

    private void executeSchemaScript() {
        try {
            // Load schema SQL from file
            String schemaScript = readResourceFile("/db/schema_fix.sql");
            
            // Connect directly to MySQL server (not to a specific DB)
            String url = "jdbc:mysql://localhost:3306";
            String user = "root";
            String password = "password";
            
            try (Connection connection = DriverManager.getConnection(url, user, password);
                 Statement statement = connection.createStatement()) {
                
                // Execute the schema script statement by statement to avoid issues
                for (String sqlStatement : schemaScript.split(";")) {
                    if (!sqlStatement.trim().isEmpty()) {
                        statement.execute(sqlStatement);
                    }
                }
                System.out.println("Schema script executed successfully");
            }
        } catch (Exception e) {
            System.err.println("Error executing schema script: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void executeInitScript() {
        try {
            // Now, connect to the gosjsu database
            String url = "jdbc:mysql://localhost:3306/gosjsu";
            String user = "root";
            String password = "password";
            
            // Load init SQL from file
            String initScript = readResourceFile("/db/init_fix.sql");
            
            try (Connection connection = DriverManager.getConnection(url, user, password);
                 Statement statement = connection.createStatement()) {
                
                // Execute the init script statement by statement to avoid issues
                for (String sqlStatement : initScript.split(";")) {
                    if (!sqlStatement.trim().isEmpty()) {
                        try {
                            statement.execute(sqlStatement);
                        } catch (SQLException e) {
                            System.err.println("Error executing statement: " + sqlStatement);
                            System.err.println("Error message: " + e.getMessage());
                            // Continue with the next statement
                        }
                    }
                }
                System.out.println("Init script executed successfully");
            }
        } catch (Exception e) {
            System.err.println("Error executing init script: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private String readResourceFile(String resourcePath) throws Exception {
        try (InputStream inputStream = getClass().getResourceAsStream(resourcePath)) {
            if (inputStream == null) {
                throw new Exception("Resource not found: " + resourcePath);
            }
            
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
                return reader.lines().collect(Collectors.joining("\n"));
            }
        }
    }
} 