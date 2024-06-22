
package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection con;
    private static final String URL="jdbc:mysql://localhost:3306/clothingstore";
     private static final String USER="root";
    private static final String PASSWORD="pass";
   
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection(URL,USER,PASSWORD);
        }
        catch(ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
    
    public static void closeConnection() {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
