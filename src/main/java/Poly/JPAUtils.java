package Poly;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtils {
	private static EntityManagerFactory facrory;
	private static EntityManager em;
	public JPAUtils() {
		// TODO Auto-generated constructor stub
	}

	public static EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}
	
	public static void setup() {
		// TODO Auto-generated method stub
		if(facrory==null || !facrory.isOpen()) {
			facrory = Persistence.createEntityManagerFactory("ProjectLab6");
			em = facrory.createEntityManager();
		}	
	}
	
	public static void begin() {
		// TODO Auto-generated method stub
		em.getTransaction().begin();
	}
	public static void commit() {
		// TODO Auto-generated method stub
		em.getTransaction().commit();
		System.out.println("Commit succes...");
	}
	
	
	public static void rollback(Exception e) {
		// TODO Auto-generated method stub
		em.getTransaction().rollback();
		System.out.println("Rollback ! "+e);
	}
	
	
	public static void shutdown() {
		// TODO Auto-generated method stub
		if(facrory!=null || facrory.isOpen()) {
			em.close();
			facrory.close();	
			System.out.println("Close connect...");
		}
		facrory=null;
	}

}
