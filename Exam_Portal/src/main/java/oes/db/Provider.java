package oes.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Provider {

    private static final String URL = "jdbc:mysql://localhost:3306/exam_portal";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("JDBC Driver not found!");
        }
    }

    public static Connection getOracleConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Connection failed!");
        }
        return con;
    }
}
