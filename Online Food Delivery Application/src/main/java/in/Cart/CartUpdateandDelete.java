package in.Cart;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/cartmodify")
public class CartUpdateandDelete extends HttpServlet {
	@Override
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		final DecimalFormat df = new DecimalFormat("0.00");
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) req.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<>();
		}
		String action = req.getParameter("action");
		int itemid = Integer.parseInt(req.getParameter("itemid"));
		try {
			if ("update".equals(action)) {
				int quantity = Integer.parseInt(req.getParameter("quantity"));
				if (quantity > 0 && cart.containsKey(itemid)) {
					CartItem item = cart.get(itemid);
					double basePrice = item.getPrice() / item.getQuantity();  
					double newTotalPrice = basePrice * quantity;
					item.setQuantity(quantity);
					item.setPrice(Double.parseDouble(df.format(newTotalPrice)));  
				}
			}  else if ("delete".equals(action)) {
				cart.remove(itemid);
			}
			req.getSession().setAttribute("cart", cart);
			resp.sendRedirect("Cart.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing cart action");
		}
	}
}

