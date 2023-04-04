package Poly;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.TypedQuery;

import Entity.User;

public class UserDAO {

	public UserDAO() {
		// TODO Auto-generated constructor stub

	}

	public boolean create(User entity) {
		boolean rs = false;
		JPAUtils.setup();
		try {
			JPAUtils.begin();
			JPAUtils.getEntityManager().persist(entity);
			JPAUtils.commit();
			System.out.println("Thêm mới thành công!");
			rs = true;
		} catch (Exception e) {
			JPAUtils.rollback(e);
			System.out.println("Thêm mới thất bại!");
		}
		JPAUtils.shutdown();
		return rs;
	}

	public boolean update(User entity) {
		boolean rs = false;
		User entityNew = findByUsername(entity.getUsername());
		JPAUtils.setup();
		try {
			JPAUtils.begin();
			entityNew.setAdmin(entity.getAdmin());
			entityNew.setEmail(entity.getEmail());
			entityNew.setFullname(entity.getFullname());
			entityNew.setPasswords(entity.getPasswords());
			JPAUtils.getEntityManager().merge(entityNew);
			JPAUtils.commit();
			System.out.println("Cập nhật thành công!");
			rs = true;
		} catch (Exception e) {
			JPAUtils.rollback(e);
			System.out.println("Cập nhật thất bại!");
		}
		JPAUtils.shutdown();
		return rs;
	}

	public boolean delete(String key) {
		User entity = findByUsername(key);
		JPAUtils.setup();
		boolean rs = false;
		try {
			JPAUtils.begin();
			User entityOld = JPAUtils.getEntityManager().find(User.class, entity.getId());
			JPAUtils.getEntityManager().remove(entityOld);
//			JPAUtils.getEntityManager().remove( JPAUtils.getEntityManager().contains(entity) ? entity : JPAUtils.getEntityManager().merge(entity));
			JPAUtils.commit();
			System.out.println("Xóa thành công!");
			rs = true;
		} catch (Exception e) {
			JPAUtils.rollback(e);
			System.out.println("Xóa thất bại!");
		}
		JPAUtils.shutdown();
		return rs;
	}

	public List<User> findAll() {
		JPAUtils.setup();
		List<User> list = new ArrayList<User>();
		try {
			JPAUtils.begin();
			String jpql = "SELECT o FROM User o";
			TypedQuery<User> query = JPAUtils.getEntityManager().createQuery(jpql, User.class);
			list = query.getResultList();
			JPAUtils.commit();
			System.out.println("Truy vấn thông tin tất cả thành công!");
		} catch (Exception e) {
			JPAUtils.rollback(e);
			System.out.println("Truy vấn thông tin tất cả thất bại!");
		}
		JPAUtils.shutdown();
		return list;
	}

	public User findByUsername(String keyword) {
		JPAUtils.setup();
		List<User> list = new ArrayList<User>();
		try {
			JPAUtils.begin();
			String jpql = "SELECT o FROM User o WHERE o.username=:username";
			TypedQuery<User> query = JPAUtils.getEntityManager().createQuery(jpql, User.class);
			query.setParameter("username", keyword);
			list = query.getResultList();
			JPAUtils.commit();
			System.out.println("Truy vấn thành công!");
		} catch (Exception e) {
			JPAUtils.rollback(e);
			System.out.println("Truy vấn thất bại!");
		}
		JPAUtils.shutdown();
		return list.size() > 0 ? list.get(0) : null;
	}

}
