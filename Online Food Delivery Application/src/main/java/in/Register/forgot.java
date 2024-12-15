package in.Register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgetform")
public class forgot extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
//		resp.setHeader("Pragma", "no-cache");
//		resp.setHeader("Expires", "0");

		String myemail = req.getParameter("email1");
		String mypass = req.getParameter("pass1");
		try {
			UserDAO userDAO = new UserDAO();
			if (userDAO.checkEmailExists(myemail)) {
				boolean success = userDAO.updatePassword(myemail, mypass);
				if (success) {
					req.setAttribute("message", "Password Updated Successfullly..");
					req.getRequestDispatcher("forgot.jsp").forward(req, resp);
				} else {
					req.setAttribute("message", "Password Update Failed...");
					req.getRequestDispatcher("forgot.jsp").forward(req, resp);
				}
			} else {
				req.setAttribute("message", "Email doesn't Exist...");
				req.getRequestDispatcher("forgot.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
