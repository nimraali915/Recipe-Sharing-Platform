import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class Login extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("emaill");
        String password = request.getParameter("passw");
        

        try {
            // Replace with your database credentials
            String dbURL = "jdbc:mysql://localhost:3306/recipeswap";
            String dbUser = "root";
            String dbPassword = "";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Check if the email and password match a user in the database
            if (authenticateUser(connection, email, password)) {
                String userType = getUserType(connection, email);

                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("userType", userType);
               

                // Redirect based on user_type
                if ("user".equals(userType)) {
                    response.sendRedirect("home.jsp");
                } else if ("admin".equals(userType)) {
                    response.sendRedirect("admin_home.jsp");
                } else {
                    // Handle other user types or unexpected values
                    response.sendRedirect("error.jsp");
                }
            } else {
                // Invalid credentials, display error message
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("Log.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    private boolean authenticateUser(Connection connection, String email, String password) throws SQLException {
        String query = "SELECT * FROM user WHERE email=? AND password=?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, password);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next(); // true if a matching user is found
            }
        }
    }

    private String getUserType(Connection connection, String email) throws SQLException {
        String query = "SELECT user_type FROM user WHERE email=?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getString("user_type");
                }
            }
        }
        return null; // Handle the case where no user is found
    }
}
