package in.Restaurant;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDAO {

	private static final String url = "jdbc:mysql://localhost:3306/project";
	private static final String user = "root";
	private static final String password = "root";

	private Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url, user, password);
	}

	public boolean GetRestaurant(int id, String name, String address, String phone_number, String opening_time,
			String closing_date, int rating) throws SQLException, Exception {

		String query = "SELECT * FROM Restaurant";
		try (Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery()) {
			return rs.next();

		}
	}

	public List<Restaurant> getAllRestaurants() throws Exception {
		String query = "SELECT * FROM Restaurant";
		List<Restaurant> restaurants = new ArrayList<>();

		try (Connection con = getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query)) {

			while (rs.next()) {
				Restaurant restaurant = new Restaurant();
				restaurant.setId(rs.getInt("id"));
				restaurant.setName(rs.getString("name"));
				restaurant.setAddress(rs.getString("address"));
				restaurant.setPhone_number(rs.getString("phone_number"));
				restaurant.setOpening_time(rs.getTime("opening_time").toString());
				restaurant.setClosing_time(rs.getTime("closing_time").toString());
				restaurant.setRating(rs.getDouble("rating"));
				restaurant.setImage_url(rs.getString("image_url"));

				restaurants.add(restaurant);
			}
		}

		return restaurants;
	}
}
