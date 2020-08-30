/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validate;

import db.DBConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author pc
 */
public class ValidateFlight {

    public static boolean checkUser(String dep_date, String dep_time, String arr_date, String arr_time, String aircraft_no) {

        try {
            Connection connection = DBConnection.getInstance().getConnection();
            PreparedStatement ps = connection.prepareStatement("select * from FLIGHT where dep_date=? and dep_time=? and arr_date=? and arr_time=? and aircraft_no=?");

            ps.setString(1, dep_date);
            ps.setString(2, dep_time);
            ps.setString(3, arr_date);
            ps.setString(4, arr_time);
            ps.setString(5, aircraft_no);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (ClassNotFoundException | SQLException e) {

            e.printStackTrace();
            return false;
        }

    }
}
