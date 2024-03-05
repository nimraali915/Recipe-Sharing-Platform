import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/recipe_add")
@MultipartConfig
public class addrecpie extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        InputStream inputStream = null;

        Part filePart = req.getPart("image");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }

        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/recipeswap";
			String username = "root";
			String password = "";
			Connection con = DriverManager.getConnection(dbURL, username, password);

			if (req.getParameter("id") == null) {
		if (req.getParameter("btn_save") != null && req.getParameter("btn_save").equals("save")) {

						String name = req.getParameter("name");
                        String publishedBy = req.getParameter("publishedBy");
                        String category = req.getParameter("category");
                        String description = req.getParameter("description");
                        String qry_insert = "INSERT INTO addrecipes (name, published_by, category,description,image_path) VALUES (?, ?, ?, ?, ?)";
    					PreparedStatement statement = con.prepareStatement(qry_insert);
                            statement.setString(1, name);
                            statement.setString(2, publishedBy);
                            statement.setString(3, category);
                            statement.setString(4, description);
                            statement.setString(5, filePart.getSubmittedFileName());

                            int rowsInserted = statement.executeUpdate();
                            if (rowsInserted > 0) {
                                resp.setContentType("text/html");
                                PrintWriter pw = resp.getWriter();
                                pw.print("<h3 style='color:green; text-align:center;'>New recipe is added</h3>");
                                RequestDispatcher rd = req.getRequestDispatcher("/recpie.jsp");
                                rd.include(req, resp);
                            } else {
                                resp.setContentType("text/html");
                                PrintWriter pw = resp.getWriter();
                                pw.print("<h3 style='color:red; text-align:center;'>Error</h3>");
                                RequestDispatcher rd = req.getRequestDispatcher("/recpie.jsp");
                                rd.include(req, resp);
                            }
		}
			}
			else {
				if (req.getParameter("btn_update") != null && req.getParameter("btn_update").equals("update")) {
					int user_id = Integer.valueOf(req.getParameter("id"));
					String name = req.getParameter("name");
                    String publishedBy = req.getParameter("publishedBy");
                    String category = req.getParameter("category");
                    String description = req.getParameter("description");
                    String update_qry = "UPDATE addrecipes SET name=?, published_by=?, category=?, description=? ,image_path=? WHERE id=?";
					PreparedStatement statement = con.prepareStatement(update_qry);
					 statement.setString(1, name);
                     statement.setString(2, publishedBy);
                     statement.setString(3, category);
                     statement.setString(4, description);
                     statement.setString(5, filePart.getSubmittedFileName());
                     statement.setInt(5, user_id);
                 	int rs = statement.executeUpdate();
					if (rs > 0) {
						resp.setContentType("text/html");
						PrintWriter pw = resp.getWriter();
						pw.print("<h3 style='color:green; text-align:center;'>Recipe Updated</h3>");
						RequestDispatcher rd = req.getRequestDispatcher("/recpie.jsp");
						rd.include(req, resp);

					} else {
						resp.setContentType("text/html");
						PrintWriter pw = resp.getWriter();
						pw.print("<h3 style='color:red; text-align:center;'>Error</h3>");
						RequestDispatcher rd = req.getRequestDispatcher("/recpie.jsp");
						rd.include(req, resp);
					}
				} 
				 else {
						int del_id = Integer.valueOf(req.getParameter("id"));
						Statement statement = con.createStatement();

						int rs = statement.executeUpdate("DELETE FROM addrecipes WHERE id=" + del_id);
						if (rs > 0) {
							resp.sendRedirect(req.getContextPath() + "/recpie.jsp");
						}
					}
				}

			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
	}
    
         