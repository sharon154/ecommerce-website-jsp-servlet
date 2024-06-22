
package com.dao;

import com.entity.User;
import java.util.List;


public interface UserDao {
    public boolean userRegister(User user);
    
    public User login(String email, String password);
    
    public List<User> getAllUsers();
    
    public User getUserById(int id);
        
    public boolean deleteUsers(int id);
    
    public boolean checkPassword(int id, String pswd);
    
    public boolean updateProfile(User user);
    
    public boolean checkUser(String eml);
    
}
