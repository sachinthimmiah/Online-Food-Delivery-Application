package in.Register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
private static final String url="jdbc:mysql://localhost:3306/project";
private static final String user="root";
private static final String password="root";

 
private Connection getConnection() throws Exception {
	Class.forName("com.mysql.cj.jdbc.Driver");
	return DriverManager.getConnection(url,user,password);
}

public boolean registerUser(String name, String email, String password) throws Exception {
    String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
    try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        return ps.executeUpdate() > 0;  
    }
}

public boolean checkEmailExists(String email) throws Exception {
    String query = "SELECT * FROM users WHERE email = ?";
    try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
        ps.setString(1, email);
        try (ResultSet rs = ps.executeQuery()) {
            return rs.next();  
        }
    }
}

public boolean validateUser(String email, String password) throws Exception {
    String query = "SELECT * FROM users WHERE email = ? AND password = ?";
    try (Connection con = getConnection(); 
    		PreparedStatement ps = con.prepareStatement(query)) {
        ps.setString(1, email);
        ps.setString(2, password);
        try (ResultSet rs = ps.executeQuery()) {
            return rs.next();  
        }
    }
}

public boolean updatePassword(String email, String newPassword) throws Exception {
    String query = "UPDATE users SET password = ? WHERE email = ?";
    try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
        ps.setString(1, newPassword);
        ps.setString(2, email);
        return ps.executeUpdate() > 0;  
    }
}

public int getUserId(String myemail) throws Exception {
    String query = "SELECT user_id FROM users WHERE email = ?";
    try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
        ps.setString(1, myemail);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("user_id");  
            } else {
                return -1; 
            }
        }
    }
}



}
