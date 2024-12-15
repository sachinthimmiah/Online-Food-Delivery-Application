package GetMenuitems;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/GetMenuItemsList")
public class GetMenuItemsList extends HttpServlet{
	
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int  restaurantId=Integer.parseInt(req.getParameter("restaurantId"));
		 HttpSession session=req.getSession();
		 session.setAttribute("restaurantId",restaurantId);
		 
		 MenuDAO menuDAO=new MenuDAO();
		 try {
			 List<Menu> menuList=menuDAO.getMenuByRestaurantId(restaurantId);
//			 req.setAttribute("menulist", menuList);
			 session.setAttribute("menulist", menuList);
			  req.getRequestDispatcher("Menu.jsp").forward(req, resp);
			  
		 }catch (Exception e) {
		 e.printStackTrace();
		 resp.getWriter().write("Error: " + e.getMessage());
		}
	}
		
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	int  restaurantId=Integer.parseInt(req.getParameter("restaurantId"));
//	 HttpSession session=req.getSession();
//	 session.setAttribute("restaurantId",restaurantId);
//	 
//	 MenuDAO menuDAO=new MenuDAO();
//	 try {
//		 List<Menu> menuList=menuDAO.getMenuByRestaurantId(restaurantId);
////		 req.setAttribute("menulist", menuList);
//		 session.setAttribute("menulist", menuList);
//		  req.getRequestDispatcher("Menu.jsp").forward(req, resp);
//		  
//	 }catch (Exception e) {
//	 e.printStackTrace();
//	 resp.getWriter().write("Error: " + e.getMessage());
	
//	}
}

}
