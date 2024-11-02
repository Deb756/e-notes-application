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

import com.org.dao.NotesDao;
import com.org.dao.UserDao;
import com.org.dto.Notes;
import com.org.dto.User;

@WebServlet("/deleteNote")
public class DeleteNoteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		getting note by id 
		int id = Integer.parseInt(req.getParameter("id2"));
		Notes note = new Notes();
		NotesDao nd = new NotesDao();
//		deleting note
		boolean deleteNoteById = nd.deleteNoteById(id);
		System.out.println("Note deleted : "+deleteNoteById);
		Notes notesById = nd.fetchNotesById(id);
		
//		getting user
		HttpSession session2 = req.getSession();
		User us = (User) session2.getAttribute("logedUser");
		
//		remove note from list
		List<Notes> list = new ArrayList<Notes>();
		list.remove(notesById);
		
//		set user has many note
		us.setNotes(list);
//		set note has one user
		note.setUser(us);
//		saving the user
		UserDao dao = new UserDao();
		dao.saveUser(us);
		
//		deleting the note
//		NotesDao ndao = new NotesDao();
//		boolean deleteNoteById = ndao.deleteNoteById(notesById.getId());
//		System.out.println("Note Deleted : "+ deleteNoteById);
//		
//		resp.sendRedirect("HomePage.jsp");
		
//		fetching user after deletion
		User dltNote = dao.fetchUserById(us.getId());
		session2.setAttribute("noteSaved", dltNote);
		resp.sendRedirect("HomePage.jsp");
	}
}
