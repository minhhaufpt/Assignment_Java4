package Poly;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import Entity.Report;

public class ReportDAO {

	public ReportDAO() {
		// TODO Auto-generated constructor stub
	}

	public List<Report> creatReport() {
		JPAUtils.setup();
		List<Report> list = new ArrayList<Report>();
		try {
			JPAUtils.begin();
			String jpql = "SELECT new Report(o.video.title, count(o), max(o.likeDate), min(o.likeDate)) FROM Favorite o GROUP BY o.video.title";
			TypedQuery<Report> query = JPAUtils.getEntityManager().createQuery(jpql, Report.class);
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

	@SuppressWarnings("unchecked")
	public List<Report> reportToYear(Integer year) {
		JPAUtils.setup();
		List<Report> list = new ArrayList<Report>();
		try {
			JPAUtils.begin();
			StoredProcedureQuery query = JPAUtils.getEntityManager().createNamedStoredProcedureQuery("Report.favoriteByYear");
			query.setParameter("year", year);
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
