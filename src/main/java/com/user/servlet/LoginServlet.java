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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            UserDaoImpl dao = new UserDaoImpl(DBConnection.getConnection());

            HttpSession session = req.getSession();

            String email = req.getParameter("email_id");
            String password = req.getParameter("password");

            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User user = new User();
                user.setName("Admin");
                session.setAttribute("userobj", user);
                resp.sendRedirect("admin/adhome.jsp");
            } else {
                User user = dao.login(email, password);
                if (user != null) {
                    session.setAttribute("userobj", user);
                    resp.sendRedirect("index.jsp");

                } else {
                    session.setAttribute("failedMsg", "Email or Password invalid");
                    resp.sendRedirect("login.jsp");

                }
            }
            //System.out.println(email+" "+password);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
