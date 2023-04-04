package Poly;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import org.apache.commons.beanutils.BeanUtils;

import Entity.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet({"/user/index", "/user/edit/id", "/user/create", "/user/update", "/user/delete", "/reset" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		UserDAO uDAO = new UserDAO();
		List<User> list = uDAO.findAll();
		request.setAttribute("Users", list);
		if (uri.contains("edit")) {
			try {
				String id = request.getParameter("id");
				User crrUser = uDAO.findByUsername(id);
				if (crrUser != null) {
					request.setAttribute("alert", "Hiển thị thành công");
					request.setAttribute("idInfor", crrUser);
				}
			} catch (Exception e) {
				request.setAttribute("alert", "Hiển thị thất bại");
				System.out.println(e);
			}
		} else if (uri.contains("reset")) {
			try {
				User crrUser = new User();
				request.setAttribute("alert", "Reset thành công");
				request.setAttribute("idInfor", crrUser);
			} catch (Exception e) {
				request.setAttribute("alert", "Reset thất bại");
				System.out.println(e);
			}
		}

		request.getRequestDispatcher("/views/ManageUser.jsp").forward(request, response);
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
		String uri = request.getRequestURI();
		UserDAO uDAO = new UserDAO();
		// Lấy thông tin của request
		User user = new User();		
		if (uri.contains("create")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				if (user.getUsername() == null|| user.getPasswords()== null || user.getFullname()== null) {
					request.setAttribute("alert", "Điền đầy đủ thông tin");
				} else {
					uDAO.create(user);			
					request.setAttribute("alert", "Thêm thành công");
				}
			} catch (Exception e) {
				request.setAttribute("alert", "Thêm thất bại");
				System.out.println(e);
			}
		} else if (uri.contains("update")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				if (user.getUsername() == null|| user.getPasswords()== null || user.getFullname()== null) {
					request.setAttribute("alert", "Điền đầy đủ thông tin");
				} else {
					uDAO.update(user);
					request.setAttribute("alert", "Cập nhật thành công");
				}
			} catch (Exception e) {
				request.setAttribute("alert", "Cập nhật thất bại");
				System.out.println(e);
			}

		} else if (uri.contains("delete")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				if (user.getUsername()== null) {
					request.setAttribute("alert", "Điền đầy đủ thông tin");
				} else {
					uDAO.delete(user.getUsername());
					request.setAttribute("alert", "Xóa thành công");
				}
			} catch (Exception e) {
				request.setAttribute("alert", "Xóa thất bại");
				System.out.println(e);
			}
		}
		doGet(request, response);
	}

}
