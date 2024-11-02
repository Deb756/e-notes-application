package com.org.NotesController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.NotesDao;
import com.org.dao.UserDao;
import com.org.dto.Notes;
import com.org.dto.User;

@WebServlet("/EditNote")
public class UpdateNoteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		getting id here through hidden form field
		int id = Integer.parseInt(req.getParameter("id"));
		
		NotesDao ndao = new NotesDao();
		Notes fetchNotesById = ndao.fetchNotesById(id);
		
//		making session to send user info
		HttpSession session = req.getSession();
		session.setAttribute("noteUpdate", fetchNotesById);
		resp.sendRedirect("UpdateNote.jsp");
	}
}
