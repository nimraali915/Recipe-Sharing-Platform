import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserInfoServlet")
public class userinfo extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String email = (String) session.getAttribute("email");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"username\":\"" + username + "\",\"email\":\"" + email + "\"}");
        out.flush();
    }
}

