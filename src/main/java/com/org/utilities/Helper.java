package com.org.utilities;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Helper {
	private static EntityManagerFactory emf;
	
	public static EntityManagerFactory getEMF() {
		if(emf == null)
		{
			emf = Persistence.createEntityManagerFactory("karthik");
		}
		
		return emf;
	}
}
