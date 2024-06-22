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

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("user_name");
            String email = req.getParameter("email_id");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");

            User user = new User();
            user.setId(id);
            user.setName(name);
            user.setEmail(email);
            user.setPhone(phone);

            UserDaoImpl dao = new UserDaoImpl(DBConnection.getConnection());
            HttpSession session = req.getSession();

            boolean f = dao.checkPassword(id, password);
            if (f) {
                boolean f2 = dao.updateProfile(user);
                if (f2) {
                    session.setAttribute("successMsg", "Profile Updated Successfully");
                    resp.sendRedirect("editprofile.jsp");
                } else {
                    session.setAttribute("failedMsg", "Your password is incorrect");
                    resp.sendRedirect("editprofile.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Password you entered is incorrect");
                resp.sendRedirect("editprofile.jsp");

            }
        } catch (IOException | NumberFormatException e) {
            e.printStackTrace();
        }

    }

}
