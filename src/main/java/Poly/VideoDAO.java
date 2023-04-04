package Poly;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import Entity.Video;

public class VideoDAO {

	public VideoDAO() {
		// TODO Auto-generated constructor stub
	}

	public boolean create(Video entity) {
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

	public boolean update(Video entity) {
		return false;
	}

	public boolean delete(String key) {
		return false;
	}

	public List<Video> findAll() {
		JPAUtils.setup();
		List<Video> list = new ArrayList<Video>();
		try {
			JPAUtils.begin();
			String jpql = "SELECT o FROM Video o";
			TypedQuery<Video> query = JPAUtils.getEntityManager().createQuery(jpql, Video.class);
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

	public List<Video> findByKeyword(String key) {
		JPAUtils.setup();
		List<Video> list = new ArrayList<Video>();
		try {
			JPAUtils.begin();
			TypedQuery<Video> query = JPAUtils.getEntityManager().createNamedQuery("Video.findByKeyword", Video.class);
			query.setParameter("keyword", "%" + key + "%");
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

	public List<Video> findByUsername(String key) {
		JPAUtils.setup();
		List<Video> list = new ArrayList<Video>();
		try {
			JPAUtils.begin();
			TypedQuery<Video> query = JPAUtils.getEntityManager().createNamedQuery("Video.findByUser", Video.class);
			query.setParameter("us", key);
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

	public List<Video> findByFormToDate(Date form, Date to) {
		JPAUtils.setup();
		List<Video> list = new ArrayList<Video>();
		try {
			JPAUtils.begin();
			TypedQuery<Video> query = JPAUtils.getEntityManager().createNamedQuery("Video.findInRange", Video.class);
			query.setParameter("min", form);
			query.setParameter("max", to);
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

	public List<Video> findByMonths(List<Integer> months) {
		JPAUtils.setup();
		List<Video> list = new ArrayList<Video>();
		try {
			JPAUtils.begin();
			String jpql = "SELECT DISTINCT o.video FROM Favorite o WHERE MONTH(o.likeDate) IN (:months)";
			TypedQuery<Video> query = JPAUtils.getEntityManager().createQuery(jpql, Video.class);
			query.setParameter("months", months);
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
	
	@SuppressWarnings("unchecked")
	public List<Video> selectRandomTop10() {
		JPAUtils.setup();
		List<Video> list = new ArrayList<Video>();
		try {
			JPAUtils.begin();
			Query query = JPAUtils.getEntityManager().createNamedQuery("Report.random10");
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

}
