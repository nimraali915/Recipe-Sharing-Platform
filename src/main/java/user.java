
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user_submit")
public class user extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/recipeswap";
			String username = "root";
			String password = "";
			Connection con = DriverManager.getConnection(dbURL, username, password);

			if (req.getParameter("id") == null) {
				if (req.getParameter("btn_save") != null && req.getParameter("btn_save").equals("save")) {

					String name = req.getParameter("name");
					String email = req.getParameter("email");
					String pass = req.getParameter("pass");

					String qry_insert = "INSERT INTO user (name, email, password) VALUES (?, ?, ?)";
					PreparedStatement statement = con.prepareStatement(qry_insert);
					statement.setString(1, name);
					statement.setString(2, email);
					statement.setString(3, pass);

					int rowsInserted = statement.executeUpdate();
					if (rowsInserted > 0) {
						resp.setContentType("text/html");
						PrintWriter pw = resp.getWriter();
						pw.print("<h3 style='color:green; text-align:center;'>User Inserted</h3>");
						RequestDispatcher rd = req.getRequestDispatcher("/user.jsp");
						rd.include(req, resp);
					} else {
						resp.setContentType("text/html");
						PrintWriter pw = resp.getWriter();
						pw.print("<h3 style='color:red; text-align:center;'>Error</h3>");
						RequestDispatcher rd = req.getRequestDispatcher("/user.jsp");
						rd.include(req, resp);
					}
				}
			} else {
				if (req.getParameter("btn_update") != null && req.getParameter("btn_update").equals("update")) {
					int user_id = Integer.valueOf(req.getParameter("id"));
					String name = req.getParameter("name");
					String email = req.getParameter("email");
					String pass = req.getParameter("pass");
					String userType = req.getParameter("userType");

					String update_qry = "UPDATE user SET name=?, email=?, password=?, user_type=? WHERE id=?";
					PreparedStatement statement = con.prepareStatement(update_qry);
					statement.setString(1, name);
					statement.setString(2, email);
					statement.setString(3, pass);
					statement.setString(4, userType);
					statement.setInt(5, user_id);

					int rs = statement.executeUpdate();
					if (rs > 0) {
						resp.setContentType("text/html");
						PrintWriter pw = resp.getWriter();
						pw.print("<h3 style='color:green; text-align:center;'>User Info Updated</h3>");
						RequestDispatcher rd = req.getRequestDispatcher("/user.jsp");
						rd.include(req, resp);

					} else {
						resp.setContentType("text/html");
						PrintWriter pw = resp.getWriter();
						pw.print("<h3 style='color:red; text-align:center;'>Error</h3>");
						RequestDispatcher rd = req.getRequestDispatcher("/user.jsp");
						rd.include(req, resp);
					}
				} else {
					int del_id = Integer.valueOf(req.getParameter("id"));
					Statement statement = con.createStatement();

					int rs = statement.executeUpdate("DELETE FROM user WHERE id=" + del_id);
					if (rs > 0) {
						resp.sendRedirect(req.getContextPath() + "/user.jsp");
					}
				}
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
