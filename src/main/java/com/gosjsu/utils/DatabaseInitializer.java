package com.gosjsu.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.stream.Collectors;

@WebListener
public class DatabaseInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Initializing database...");
        try {
            initializeDatabase();
            System.out.println("Database initialization complete");
        } catch (Exception e) {
            System.err.println("Error initializing database: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed
        try {
            DBConnection.closeConnection();
        } catch (SQLException e) {
            System.err.println("Error closing database connection: " + e.getMessage());
        }
    }

    private void initializeDatabase() throws Exception {
        // First, create the database if it doesn't exist
        createDatabaseIfNotExists();
        
        // Then run the initialization script
        executeInitScript();
    }

    private void createDatabaseIfNotExists() throws Exception {
        // Connect to MySQL without specifying a database
        String baseUrl = "jdbc:mysql://localhost:3306/";
        String user = "root";
        String password = "password";

        try (Connection connection = java.sql.DriverManager.getConnection(baseUrl, user, password);
             Statement statement = connection.createStatement()) {
            
            // Create the database if it doesn't exist
            statement.executeUpdate("CREATE DATABASE IF NOT EXISTS gosjsu");
            System.out.println("Database 'gosjsu' created or already exists");
        }
    }

    private void executeInitScript() throws Exception {
        try (InputStream is = getClass().getClassLoader().getResourceAsStream("db/init.sql")) {
            if (is == null) {
                throw new Exception("Could not find init.sql script");
            }

            // Read the SQL script
            String sql = new BufferedReader(new InputStreamReader(is))
                            .lines().collect(Collectors.joining("\n"));

            // Split by semicolons to get individual statements
            String[] statements = sql.split(";");

            // Execute each statement
            try (Connection connection = DBConnection.getConnection();
                 Statement statement = connection.createStatement()) {
                
                for (String stmt : statements) {
                    if (!stmt.trim().isEmpty()) {
                        statement.executeUpdate(stmt);
                    }
                }
            }
        }
    }
} 