package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.org.dto.Notes;
import com.org.dto.User;
import com.org.utilities.Helper;

@Repository
public class NotesDao {
	public Notes fetchNotesById(int id) {
		// code
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();

//		fetching note by id 
		Notes nt = entityManager.find(Notes.class, id);

		return nt != null ? nt : null;
	}

	public boolean deleteNoteById(int id) {
		// code
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();

//		deleting note by id
		Notes notes = entityManager.find(Notes.class, id);
		if (notes != null) {

			User user = notes.getUser();

			List<Notes> list = user.getNotes();

			for (Notes note : list) {
				if (note.getId() == notes.getId()) {
					list.remove(note);
					break;
				}
			}

			transaction.begin();
			entityManager.merge(user);
			entityManager.remove(notes);
			transaction.commit();

			return true;
		}
		return false;

	}

	public Notes fetchNotesByTitle(String title) {
		// code
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();

//		getting Notes by title
		Query qr = entityManager.createQuery("Select e from Notes e where e.title=?1");
		qr.setParameter(1, title);

		Notes nt = (Notes) qr.getResultList();
		return nt != null ? nt : null;
	}

	public List<Notes> getNotesByUserId(int userId) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();
		entityManager.find(Notes.class, userId);
		// jpQL query to retrieve notes for a specific user
		String hql = "select e FROM Notes e WHERE e.id =?1";
		Query query = entityManager.createQuery(hql, Notes.class);
		query.setParameter(1, userId);

		// Execute the query and retrieve the list of notes
		List<Notes> notesList = query.getResultList();
		System.out.println( "ggggs : " +notesList.isEmpty());

		return notesList;
	}
}
