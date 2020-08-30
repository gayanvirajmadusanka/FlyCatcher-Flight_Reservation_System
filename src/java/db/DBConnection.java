/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author pc
 */
public class DBConnection {

    private static DBConnection dBConnection;
    private final Connection connection;

    private DBConnection() throws ClassNotFoundException, SQLException {
        //Load the driver 
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        //creating the database
        connection = DriverManager.getConnection("jdbc:derby://localhost:1527/Flycatcher_user", "app", "app");
    }

    public static DBConnection getInstance() throws ClassNotFoundException, SQLException {
        if (dBConnection == null) {
            dBConnection = new DBConnection();
        }
        return dBConnection;
    }

    public Connection getConnection() {
        return connection;
    }
}
