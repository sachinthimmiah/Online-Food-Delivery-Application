package in.Cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import GetMenuitems.Menu;
import GetMenuitems.MenuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CartItem")
public class CartServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) req.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<>();
		}
		try {
			int menuid = Integer.parseInt(req.getParameter("itemid"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			MenuDAO mnDao = new MenuDAO();
			Menu m = mnDao.fetchOne(menuid);
			if (m != null) {
				double totalPrice = m.getPrice() * quantity;
				CartItem ci = new CartItem(menuid, m.getRestaurant_id(), m.getName(), quantity, totalPrice);
				cart.put(menuid, ci);
				req.getSession().setAttribute("cart", cart);
				resp.sendRedirect("Cart.jsp");
			} else {

				resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Menu item not found");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding item to cart");
		}
	}
}
