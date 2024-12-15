package GetMenuitems;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.Session;

import in.Restaurant.Restaurant;
import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpSession;

public class MenuDAO {
	private static final String url = "jdbc:mysql://localhost:3306/project";
	private static final String user = "root";
	private static final String password = "root";

	private Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url, user, password);
	}

	public List<Menu> getMenuByRestaurantId(int restaurantId) throws Exception {
		String query = "SELECT * FROM Menu WHERE restaurant_id = ?";
		List<Menu> menuList = new ArrayList<>();

		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

			ps.setInt(1, restaurantId);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Menu menu = new Menu();
					menu.setMenuid(rs.getInt("menuid"));
					menu.setRestaurant_id(rs.getInt("restaurant_id"));
					menu.setName(rs.getString("name"));
					menu.setDescription(rs.getString("description"));
					menu.setPrice(rs.getDouble("price"));
					menu.setImage_url(rs.getString("image_url"));
					menu.setAvailable(rs.getBoolean("available"));
					menuList.add(menu);
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return menuList;
	}

	public Menu fetchOne(int menuid) throws Exception {
		String query = "SELECT * FROM menu WHERE menuid = ?";
		Menu menu = null;

		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

			ps.setInt(1, menuid);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {

					menu = new Menu();
					menu.setMenuid(rs.getInt("menuid"));
					menu.setRestaurant_id(rs.getInt("restaurant_id"));
					menu.setName(rs.getString("name"));
					menu.setDescription(rs.getString("description"));
					menu.setPrice(rs.getDouble("price"));
					menu.setImage_url(rs.getString("image_url"));
					menu.setAvailable(rs.getBoolean("available"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("Error fetching menu item by ID", e);
		}

		return menu;
	}

}
