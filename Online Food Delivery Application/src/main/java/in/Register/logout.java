package in.Register;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/logout")
public class logout extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		 HttpSession session=req.getSession();
		 session.removeAttribute("usermail");
		 session.invalidate();
		 resp.sendRedirect("login.jsp");
	}

}
