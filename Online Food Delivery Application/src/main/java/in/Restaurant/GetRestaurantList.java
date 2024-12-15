package in.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
@WebServlet("/GetRestaurantList")
public class GetRestaurantList extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	super.doPost(req, resp);
}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDAO restaurantDAO = new RestaurantDAO();
		try {
			List<Restaurant> restaurant = restaurantDAO.getAllRestaurants();
			HttpSession session = req.getSession();
			session.setAttribute("restaurantList", restaurant);
			RequestDispatcher rd = req.getRequestDispatcher("Homepage.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
