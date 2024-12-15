package History;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.util.Map;
import in.Cart.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class OrderHistoryServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/project";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart != null && !cart.isEmpty()) {
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO orderhistory (user_id, item_name, restaurant, quantity, price, total_price) " +
                             "VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);

                int user_id = (int) session.getAttribute("user_id");
                for (CartItem item : cart.values()) {
                    ps.setInt(1, user_id);
                    ps.setString(2, item.getName());
                    ps.setInt(3, item.getRestid());
                    ps.setInt(4, item.getQuantity());
                    ps.setDouble(5, item.getPrice());
                    ps.setDouble(6, item.getPrice() * item.getQuantity());
                    ps.addBatch();
                }
                ps.executeBatch();

                session.removeAttribute("cart");  
                request.setAttribute("message", "Order Successfully Placed!");
                request.getRequestDispatcher("Cart.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Error placing the order. Please try again.");
                request.getRequestDispatcher("Cart.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("cart.jsp");
        }
    }
}
