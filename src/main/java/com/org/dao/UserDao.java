package com.org.dao;

import javax.persistence.EntityManager;

import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.org.dto.User;
import com.org.utilities.Helper;

@Repository
public class UserDao {

//	used to make the emf singleton bcz if we write in all method it will create new objects soo
//	EntityManagerFactory emf = Helper.getEMF();
//	or
//	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("karthik");

	public void saveUser(User user) {
		// code database
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();

//		saving user
		transaction.begin();
		entityManager.merge(user);
		transaction.commit();
		entityManager.close();
		System.out.println("User Saved Successfully");

	}

//	UPDATE USER INFO 
	public void updateUser(int id, int age, long mobile, String name) {
		// Set up EntityManager and EntityTransaction
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();

		try {
			// Begin transaction
			transaction.begin();

			// Find the user by ID
			User us = entityManager.find(User.class, id);

			// Check if user exists
			if (us != null) {
				// Update user details
				us.setName(name);
				us.setAge(age);
				us.setMobile(mobile);

				// Merge changes into the database
				entityManager.merge(us);
				System.out.println("User updated successfully.");
			} else {
				System.out.println("User not found with ID: " + id);
			}

			// Commit transaction
			transaction.commit();
		} catch (Exception e) {
			// Roll back transaction if an error occurs
			if (transaction.isActive()) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			// Close the EntityManager
			entityManager.close();
		}
	}

	public User loginUser(String email, String password) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();

		// login by email and id by JPQL
		Query qr = entityManager.createQuery("select e from User e where e.email = ?1 AND e.password = ?2");
		qr.setParameter(1, email);
		qr.setParameter(2, password);

		try {
			// Use getSingleResult to return one User object
			User us = (User) qr.getSingleResult();
			return us;
		} catch (Exception e) {
			// Return null if no matching user is found
			return null;
		} finally {
			entityManager.close();
		}
	}

	public User existUser(String email) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();

		// login by email and id by JPQL
		Query qr = entityManager.createQuery("select e from User e where e.email = ?1");
		qr.setParameter(1, email);

		try {
			// Use getSingleResult to return one User object
			User us = (User) qr.getSingleResult();
			return us;
		} catch (Exception e) {
			// Return null if no matching user is found
			return null;
		} finally {
			entityManager.close();
		}
	}

	public void deleteUserById(int id) {
		// code database
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();

//		fetching user
		User us = entityManager.find(User.class, id);
		if (us == null) {
			System.out.println("404 User Not Found ");
		} else {
			transaction.begin();
			entityManager.remove(us);
			transaction.commit();
			entityManager.close();
			System.out.println("User removed successfully");
		}

	}

	public User fetchUserById(int id) {
		// code database
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager entityManager = emf.createEntityManager();

//		Fetching user here
		User us = entityManager.find(User.class, id);
		entityManager.close();
		return us != null ? us : null;
	}
}
