package Poly;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import Entity.User;
import Entity.Video;

public class FavoriteDAO {

	public FavoriteDAO() {
		// TODO Auto-generated constructor stub
	}

	public List<Video> findByTitleVideo(String keyword) {
		JPAUtils.setup();
		List<Video> list = new ArrayList<Video>();
		try {
			JPAUtils.begin();
			String jpql = "SELECT DISTINCT o.video FROM Favorite o WHERE o.video.title LIKE '%'||:title||'%'";
			TypedQuery<Video> query = JPAUtils.getEntityManager().createQuery(jpql, Video.class);
			query.setParameter("title", keyword);
			list = query.getResultList();
			JPAUtils.commit();
			System.out.println("Truy vấn thành công!");
		} catch (Exception e) {
			JPAUtils.rollback(e);
			System.out.println("Truy vấn thất bại!");
		}
		JPAUtils.shutdown();
		return list;
	}

	public List<User> findUserLikeByVideoId(String key) {
		JPAUtils.setup();
		List<User> list = new ArrayList<User>();
		try {
			JPAUtils.begin();
			Integer videoId = Integer.parseInt(key);
			String jpql = "SELECT o.user FROM Favorite o WHERE o.video.id=:vid";
			TypedQuery<User> query = JPAUtils.getEntityManager().createQuery(jpql, User.class);
			query.setParameter("vid", videoId);
			list = query.getResultList();
			JPAUtils.commit();
			System.out.println("Truy vấn thành công!");
		} catch (Exception e) {
			JPAUtils.rollback(e);
			System.out.println("Truy vấn thất bại!");
		}
		JPAUtils.shutdown();
		return list;
	}

	public List<Video> findVideoLike(Boolean like) {
		JPAUtils.setup();
		List<Video> list = new ArrayList<Video>();
		try {
			JPAUtils.begin();
			String jpql = "SELECT o FROM Video o WHERE o.favorites IS EMPTY";
			if (like) {
				jpql = "SELECT o FROM Video o WHERE o.favorites IS NOT EMPTY";
			}
			TypedQuery<Video> query = JPAUtils.getEntityManager().createQuery(jpql, Video.class);
			list = query.getResultList();
			JPAUtils.commit();
			System.out.println("Truy vấn thành công!");
		} catch (Exception e) {
			JPAUtils.rollback(e);
			System.out.println("Truy vấn thất bại!");
		}
		JPAUtils.shutdown();
		return list;
	}

}
