package com.user.servlet;

import com.dao.UserDaoImpl;
import com.db.DBConnection;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("user_name");
            String email = req.getParameter("email_id");
            String password = req.getParameter("password");

            //System.out.println(name+" "+email+" "+password);
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);

            HttpSession session = req.getSession();

            UserDaoImpl dao = new UserDaoImpl(DBConnection.getConnection());

            boolean f2 = dao.checkUser(email);
            if (f2) {
                boolean f = dao.userRegister(user);
                if (f) {
                    //System.out.println("Success");
                    session.setAttribute("successMsg", "Registered Successfully");
                    resp.sendRedirect("register.jsp");
                } else {
                    //System.out.println("Something went wrong on server");
                    session.setAttribute("failedMsg", "Something wrong on the server");
                    resp.sendRedirect("register.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "This email is already registered");
                resp.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
