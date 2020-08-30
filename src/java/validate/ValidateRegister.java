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
public class ValidateRegister {

    public static boolean checkUser(String user_email) {

        try {
            Connection connection = DBConnection.getInstance().getConnection();
            PreparedStatement ps = connection.prepareStatement("select * from USER2 where user_email=?");
            ps.setString(1, user_email);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (ClassNotFoundException | SQLException e) {

            e.printStackTrace();
            return false;
        }

    }
}
