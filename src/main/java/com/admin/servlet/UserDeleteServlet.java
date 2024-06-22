package com.admin.servlet;

import com.dao.UserDaoImpl;
import com.db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteuser")
public class UserDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            UserDaoImpl dao = new UserDaoImpl(DBConnection.getConnection());

            boolean f = dao.deleteUsers(id);

            HttpSession session = req.getSession();

            if (f) {

                session.setAttribute("successMsg", "User Deleted Successfully!");
                resp.sendRedirect("admin/viewall_user.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on the server");
                resp.sendRedirect("admin/viewall_user.jsp");

            }
        } catch (IOException | NumberFormatException e) {
            e.printStackTrace();
        }
    }

}
