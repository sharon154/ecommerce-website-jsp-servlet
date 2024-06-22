package com.dao;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    private final Connection con;
    PreparedStatement ps = null;

    public UserDaoImpl(Connection con) {
        super();
        this.con = con;
    }

    @Override
    public boolean userRegister(User user) {
        boolean f = false;

        try {
            String query = "insert into user(name, email, password) values(?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            int inserted = ps.executeUpdate();
            if (inserted > 0) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close(); // Close PreparedStatement
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return f;
    }

    public User login(String email, String password) {
        User user = null;
        try {
            String query = "select * from user where email=? and password=?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setLandmark(rs.getString(7));
                user.setCity(rs.getString(8));
                user.setState(rs.getString(9));
                user.setZip(rs.getString(10));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<User>();
        User user = null;
        try {
            String query = "select * from user";
            ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setLandmark(rs.getString(7));
                user.setCity(rs.getString(8));
                user.setState(rs.getString(9));
                user.setZip(rs.getString(10));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public User getUserById(int id) {
        User user = null;

        try {
            String query = "select * from user where id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setLandmark(rs.getString(7));
                user.setCity(rs.getString(8));
                user.setState(rs.getString(9));
                user.setZip(rs.getString(10));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean deleteUsers(int id) {
        boolean f = false;
        try {
            String query = "delete from user where id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            int inserted = ps.executeUpdate();
            if (inserted > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean checkPassword(int id, String pswd) {
        boolean f = false;
        try {
            String query = "select * from user where id=? and password=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, pswd);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean updateProfile(User user) {
        boolean f = false;

        try {
            String query = "update user set name=?, email=?, phone=? where id=?";
            ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setInt(4, user.getId());
            
            int updated = ps.executeUpdate();
            if (updated > 0) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close(); // Close PreparedStatement
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return f;
    }

    @Override
    public boolean checkUser(String eml) {
        boolean f = true;

        try {
            String query = "select * from user where email=?";
            ps = con.prepareStatement(query);
            ps.setString(1, eml);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close(); // Close PreparedStatement
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return f;
    }

}
