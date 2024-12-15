package in.Register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registerform")
public class Register extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		String myname = req.getParameter("name");
		String myemail = req.getParameter("email");
		String mypass = req.getParameter("password");
		String confpass = req.getParameter("password1");

		if (!mypass.equals(confpass)) {
			req.setAttribute("message", "Passwords do not match.");
			req.getRequestDispatcher("Register.jsp").forward(req, resp);
			return;
		}
		try {
			UserDAO userDAO = new UserDAO();
			boolean success = userDAO.registerUser(myname, myemail, mypass);
			if (success) {
				req.setAttribute("message", "Registration SuccessFull....");
				req.getRequestDispatcher("Register.jsp").forward(req, resp);

			} else {
				req.setAttribute("message", "Registration Failed.");
				req.getRequestDispatcher("forgot.jsp").forward(req, resp);

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "An error occurred.");
		}
		req.getRequestDispatcher("Register.jsp").forward(req, resp);
	}
}
