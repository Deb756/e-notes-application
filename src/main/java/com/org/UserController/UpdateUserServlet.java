package com.org.UserController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/UpdateUserProfile")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Extract parameters
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        long mobile = Long.parseLong(req.getParameter("mobile"));
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Update user details in database
        UserDao udo = new UserDao();
        udo.updateUser(id, age, mobile, name);

        // Retrieve the updated user
        User updatedUser = new User(name, age, mobile, email, password);

        // Update session with the latest user data
        HttpSession session = req.getSession();
        session.setAttribute("updateUser", updatedUser); // Update `logedUser`

        // Redirect to the home page
        resp.sendRedirect("HomePage.jsp");
    }
}


//String name = req.getParameter("name");
//int age = Integer.parseInt(req.getParameter("age"));
//long mobile = Long.parseLong(req.getParameter("mobile"));
//String email = req.getParameter("email");
//String password = req.getParameter("password");
//
////saving it in a user Object 
//User us = new User(name,age,mobile,email,password);
////saving user
//UserDao ud = new UserDao();
//ud.saveUser(us);
////redirecting to index page
//RequestDispatcher requestDispatcher = req.getRequestDispatcher("Login.jsp");
//
//try {
//	requestDispatcher.forward(req, resp);
//} catch (Exception e) {
//	// TODO: handle exception
//	e.printStackTrace();
//}