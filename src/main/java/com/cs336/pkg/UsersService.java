package com.cs336.pkg;

import java.io.*;
import java.util.*;
import java.sql.*;
import java.util.Optional;

public class UsersService {
    private final ApplicationDB db;
    private final Connection con;

    public  UsersService() {
        db = new ApplicationDB();
        con = db.getConnection();
    }


    public Optional<Users> getUser(String username){
        String select = ("SELECT * FROM application.users WHERE username = ?");
        //Create a Prepared SQL statement allowing you to introduce the parameters of the query
        try{
            PreparedStatement ps = con.prepareStatement(select);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String password = rs.getString(2);
            String firstName = rs.getString(3);
            String lastName = rs.getString(4);
            String email = rs.getString(5);
            String role = rs.getString(6);

            System.out.println("STUDENT OBJECT " + username + " " + password + " " + firstName + " " + lastName + " " + email + " " + role);
            Users user = new Users(username,password,firstName,lastName,email,role);
            return Optional.of(user);
        }

        catch(SQLException e){
            System.out.println(e);
            return Optional.empty();

        }

    }
}
