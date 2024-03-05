import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/contact")
public class contact extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/recipeswap";
            String username = "root";
            String password = "";
            Connection con = DriverManager.getConnection(dbURL, username, password);

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String message = req.getParameter("message");
            String qry_insert = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            
            try (PreparedStatement statement = con.prepareStatement(qry_insert)) {
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setString(3, message);

                int rowsInserted = statement.executeUpdate();

                if (rowsInserted > 0) {
                    resp.setContentType("text/html");
                    PrintWriter pw = resp.getWriter();
                    pw.print("<h3 style='color:green; text-align:center;'>Message Sent successful</h3>");
                    RequestDispatcher rd=req.getRequestDispatcher("/contact.jsp");
                    rd.include(req, resp);
                } else {
                    resp.setContentType("text/html");
                    PrintWriter pw = resp.getWriter();
                    pw.print("<h3 style='color:red; text-align:center;'>Error in Sending message</h3>");
                    RequestDispatcher rd=req.getRequestDispatcher("/contact.jsp");
                    rd.include(req, resp);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
