package in.Register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverAction;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.Session;

import in.Restaurant.GetRestaurantList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginform")
public class login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
		String myemail = req.getParameter("email1");
		String mypass = req.getParameter("pass1");
		try {
			UserDAO userDAO = new UserDAO();
			if (userDAO.validateUser(myemail, mypass)) {
//				RequestDispatcher rd = req.getRequestDispatcher("/GetRestaurantList");
//				rd.forward(req, resp);
				resp.sendRedirect("GetRestaurantList");
				HttpSession session = req.getSession();
				session.setAttribute("usermail", myemail);
				int userId = userDAO.getUserId(myemail);
	            session.setAttribute("user_id", userId);
				System.out.println("CONNECTION SUCCESS");
				 System.out.println("userid:" + userId);
			 
//                System.out.println("DATA PASSED");

			} else {
				req.setAttribute("messagelogin", "Email and password doesn't match...");
				 
			 resp.sendRedirect("login.jsp");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}
