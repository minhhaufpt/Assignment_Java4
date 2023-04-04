package Poly;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Entity.Favorite;
import Entity.Report;
import Entity.User;
import Entity.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VideoServlet
 */
@WebServlet({ "/find_user", "/find_title", "/find_videoid", "/find_videolike", "/find_keyvideo", "/find_keyuser",
		"/find_forDate", "/find_month" ,"/report_year"})
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReportDAO Rdao = new ReportDAO();
		VideoDAO Vdao = new VideoDAO();
		List<Report> report = Rdao.creatReport();
		List<Video> videos = Vdao.selectRandomTop10();
		request.setAttribute("Report", report);
		request.setAttribute("listramdom", videos);
		request.getRequestDispatcher("/views/ManageVideo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		UserDAO dao = new UserDAO();
		VideoDAO Vdao = new VideoDAO();
		FavoriteDAO Fdao = new FavoriteDAO();
		ReportDAO Rdao = new ReportDAO();
		String uri = request.getRequestURI();
		if (uri.contains("find_user")) {
			String username = request.getParameter("username");
			User user = dao.findByUsername(username);
			request.setAttribute("user", user);
			List<Favorite> favorites = user.getFavorites();
			request.setAttribute("favorites", favorites);
		} else if (uri.contains("find_title")) {
			String title = request.getParameter("title");
			List<Video> videos = Fdao.findByTitleVideo(title);
			request.setAttribute("videos", videos);
		} else if (uri.contains("find_videoid")) {
			String videoid = request.getParameter("videoid");
			List<User> users = Fdao.findUserLikeByVideoId(videoid);
			request.setAttribute("users", users);
		} else if (uri.contains("find_videolike")) {
			Boolean like = Boolean.parseBoolean(request.getParameter("favorite"));
			List<Video> videos = Fdao.findVideoLike(like);
			request.setAttribute("videosLike", videos);
		} else if (uri.contains("find_keyvideo")) {
			String key = request.getParameter("keyword");
			List<Video> videos = Vdao.findByKeyword(key);
			request.setAttribute("keyvideos", videos);
		} else if (uri.contains("find_keyuser")) {
			String key = request.getParameter("keyuser");
			List<Video> videos = Vdao.findByUsername(key);
			request.setAttribute("videoByUser", videos);
		} else if (uri.contains("find_forDate")) {
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
			Date formdate = new Date();
			Date todate = new Date();
			try {
				formdate = fm.parse(request.getParameter("formdate"));
				todate = fm.parse(request.getParameter("todate"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			List<Video> videos = Vdao.findByFormToDate(formdate, todate);
			request.setAttribute("videoByForDate", videos);
		} else if (uri.contains("find_month")) {
			String[] values = request.getParameterValues("month");
			List<Integer> months = new ArrayList<Integer>();
			for (String month : values) {
				months.add(Integer.valueOf(month));
			}
			List<Video> videos = Vdao.findByMonths(months);
			request.setAttribute("videoByMonth", videos);
		}else if (uri.contains("report_year")) {
			Integer year = Integer .valueOf(request.getParameter("year"));
			List<Report> report = Rdao.reportToYear(year);
			request.setAttribute("ReportYear", report);
		}
		doGet(request, response);
	}

}
