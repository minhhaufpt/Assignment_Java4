package Poly;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import Entity.User;


public class JPAProgram {

	public JPAProgram() {
		// TODO Auto-generated constructor stub

	}

	public static void main(String[] args) {
//		create();
//		update();
//		delete();
		findAll();
	}

	@SuppressWarnings("unused")
	private static void create() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProjectFinal");
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); 
			User entity = new User();
			entity.setUsername("minhhaunek");
			entity.setFullname("Nguyễn Minh Hậu");
			entity.setEmail("haunguyen@gmail.com");
			entity.setPasswords("123456");
			em.persist(entity);
			em.getTransaction().commit();
			System.out.println("Thêm mới thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Thêm mới thất bại!");
		}
		em.close();
		emf.close();
	}

	@SuppressWarnings("unused")
	private static void update() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProjectFinal");
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); 
			
			User entity = em.find(User.class, "minhhaunek");
			entity.setPasswords("poly@2020");
			entity.setAdmin(true);
			em.merge(entity);
			em.getTransaction().commit();
			System.out.println("Cập nhật thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Cập nhật thất bại!");
		}
		em.close();
		emf.close();

	}

	@SuppressWarnings("unused")
	private static void delete() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProjectFinal");
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); 
			User entity = em.find(User.class, "minhhaunek");
			em.remove(entity);
			em.getTransaction().commit();
			System.out.println("Xóa thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Xóa thất bại!");
		}
		em.close();
		emf.close();
	}

	private static void findAll() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProjectFinal");
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); 
			
			String jpql = "SELECT o FROM User o";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			List<User> list = query.getResultList();
			for(User user: list) {
			System.out.println(">>Fullname: " + user.getFullname());
			System.out.println(">>Is Admin: " + user.getAdmin());
			}
			
			em.getTransaction().commit();
			System.out.println("Truy vấn thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Truy vấn thất bại!");
		}
		em.close();
		emf.close();
	}

	@SuppressWarnings("unused")
	private static void findByRole(boolean role) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProjectFinal");
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); 
			
			String jpql = "SELECT o FROM User o WHERE o.admin=:role";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("role", role);
			List<User> list = query.getResultList();
			
			em.getTransaction().commit();
			System.out.println("Truy vấn thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Truy vấn thất bại!");
		}
		em.close();
		emf.close();
	}

	@SuppressWarnings("unused")
	private static void findByKeyWord(String keyword) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProjectFinal");
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); 
			
			String jpql = "SELECT o FROM User o WHERE o.fullname LIKE ?0";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter(0, keyword);
			List<User> list = query.getResultList();
			
			em.getTransaction().commit();
			System.out.println("Truy vấn thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Truy vấn thất bại!");
		}
		em.close();
		emf.close();
	}

	@SuppressWarnings("unused")
	private static void findOne(String username, String password) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProjectFinal");
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); 
			
			String jpql = "SELECT o FROM User o WHERE o.id=:username AND o.password=:password";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("password", password);
			User user = query.getSingleResult();
			System.out.println(">>Fullname: " + user.getFullname());
			System.out.println(">>Is Admin: " + user.getAdmin());
			
			em.getTransaction().commit();
			System.out.println("Truy vấn thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Truy vấn thất bại!");
		}
		em.close();
		emf.close();
	}

	@SuppressWarnings("unused")
	private static void finPage(int page, int size) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProjectFinal");
		EntityManager em = emf.createEntityManager();
		try {
			em.getTransaction().begin(); 
			
			String jpql = "SELECT o FROM User o";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setFirstResult(page * size);
			query.setMaxResults(size);
			List<User> list = query.getResultList();
			for(User user: list) {
			System.out.println(">>Fullname: " + user.getFullname());
			System.out.println(">>Is Admin: " + user.getAdmin());
			}

			em.getTransaction().commit();
			System.out.println("Truy vấn thành công!");
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Truy vấn thất bại!");
		}
		em.close();
		emf.close();
	}
}
