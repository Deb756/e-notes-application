package com.org.UserController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.Notes;
import com.org.dto.User;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");  
        
        // Getting parameters
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        // Add it to UserDao function/method
        UserDao ud = new UserDao();
        User logedUser = ud.loginUser(email, password);
        
        PrintWriter writer = resp.getWriter();
        writer.println("<html><body>");
        
        //Creating session in login
        HttpSession session = req.getSession();
        
        // Check if the user is null
        if (logedUser != null) {
        	session.setAttribute("logedUser",logedUser);
        	List<Notes> notes = logedUser.getNotes(); // Make sure the notes are loaded here
        	HttpSession session2 = req.getSession();
        	session2.setAttribute("notes", notes);
        	resp.sendRedirect("HomePage.jsp");
        } else {
        	session.setAttribute("msg","Invalid");
        	resp.sendRedirect("Login.jsp");
//            writer.println("<h1>Login Failed</h1>");
//            writer.println("<p>Invalid email or password.</p>");
        }
        
        writer.println("</body></html>");
    }
}
