package com.org.NotesController;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/AddNote")
public class AddNotesServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		
//		create note add details
		Notes nt = new Notes();
		nt.setTitle(title);
		nt.setDescription(description);
		
//		get user obj
		HttpSession session = req.getSession();
		User us = (User) session.getAttribute("logedUser");
		
//		add note to list
		List<Notes> list = new ArrayList<Notes>();
		list.add(nt);
		
//		set user has many notes
		us.setNotes(list);
		
//		set note has one user
		nt.setUser(us);
		
		UserDao dao = new UserDao();
		dao.saveUser(us);
		User updateNote = dao.fetchUserById(us.getId());
		session.setAttribute("noteSaved", updateNote);
		resp.sendRedirect("HomePage.jsp");
//		User updatedUser = userService.getUserWithNotes(us.getId());
//		session.setAttribute("logedUser", updatedUser);
		
	}
}
