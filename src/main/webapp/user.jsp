<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
    <title>User Info</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    
</head>

<body>

	<%@ include file="admin_header.jsp" %>
    
    <div class="container mt-5 ">
        <div class="row">
            <div class="col-md-6">
                <h3>Add New User</h3>

                <% if (request.getParameter("id") == null) { %>

                <form method="post" action="user_submit">
           
                <div class="mb-6 mt-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" placeholder="Enter Name" name="name">
                </div>
                <div class="mb-6">
                    <label for="email" class="form-label">email:</label>
                    <input type="email" class="form-control" placeholder="Enter email" name="email">
                </div>
                <div class="mb-6">
                    <label for="password" class="form-label">password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" name="pass">
                </div>
                 
				<br>
                <button type="submit" class="btn btn-dark" name="btn_save" value="save">Save</button>

            </form>
	<%@ page import="java.sql.*"%>
            <% } else {

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/recipeswap", "root","");
                Statement statement = connection.createStatement();

                int std_id = Integer.valueOf(request.getParameter("id"));

                ResultSet resultset = statement.executeQuery("select * from user where id=" + std_id);
                while (resultset.next()) {

            %>

            <form method="post" action="user_submit">
                <div class="mb-3 mt-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" value="<%= resultset.getString(2) %>" name="name">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">E-mail:</label>
                    <input type="email" class="form-control" value="<%= resultset.getString(3) %>" name="email">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" value="<%= resultset.getString(4) %>" name="pass">
                </div>
                 <div class="mb-6">
                    <label for="usertype" class="form-label">User Type:</label>
                    <input type="text" class="form-control" value="<%= resultset.getString(5) %>" name="userType">
                </div>

                <input type="hidden" name="id" value="<%= resultset.getString(1) %>">
                <br>
                <button type="submit" class="btn btn-dark" name="btn_update" value="update">Update</button>

            </form>

            <% }
                } %>


            <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/recipeswap", "root", "");
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from user");
            %>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>email</th>
                        <th>password</th>
                        <th>UserType</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (resultset.next()) { %>
                    <tr>
                        <td><%= resultset.getString(1) %></td>
                        <td><%= resultset.getString(2) %></td>
                        <td><%= resultset.getString(3) %></td>
                        <td><%= resultset.getString(4) %></td>
                        <td><%= resultset.getString(5) %></td>
                        <td><a class="btn btn-dark"
                                href="user_submit?id=<%= resultset.getString(1) %>">Delete</a></td>
                        <td><a class="btn btn-dark"
                                href="user.jsp?id=<%= resultset.getString(1) %>">Edit</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
</div>
          
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  
</body>

</html>
    