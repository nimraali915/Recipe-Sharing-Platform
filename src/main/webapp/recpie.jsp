<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
<title>Recipe Info</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

</head>

<body>

	<%@ include file="admin_header.jsp"%>
	<%@ page import="java.sql.*"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3>Add New Recipe</h3>

				<% if (request.getParameter("id") == null) { %>
				<form action="recipe_add" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label for="name" class="form-label">Recipe Name:</label> <input
							type="text" class="form-control" id="name" name="name" required>
					</div>

					<div class="mb-3">
						<label for="publishedBy" class="form-label">Published By:</label>
						<input type="text" class="form-control" id="publishedBy"
							name="publishedBy" required>
					</div>

					<div class="mb-3">
						<label for="category" class="form-label">Category:</label> <select
							class="form-select" id="category" name="category" required>
							<option value="Local Food">Local Food</option>
							<option value="Fast Food">Fast Food</option>
							<option value="Beverages">Beverages</option>
							<option value="Sweets">Sweets</option>
						</select>
					</div>

					<div class="mb-3">
						<label for="description" class="form-label">Description:</label>
						<textarea class="form-control" id="description" name="description"
							rows="4" required></textarea>
					</div>

					<div class="mb-3">
						<label for="image" class="form-label">Recipe Image:</label> <input
							type="file" class="form-control" id="image" name="image"
							accept="image/*" required>
					</div>
					<br>
					<button type="submit" class="btn btn-dark" name="btn_save"
						value="save">Save</button>

				</form>

				<% } else {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/recipeswap", "root","");
                    Statement statement = connection.createStatement();

                    int r_id = Integer.valueOf(request.getParameter("id"));

                    ResultSet resultset = statement.executeQuery("select * from addrecipes where id=" + r_id);
                    while (resultset.next()) {
                %>

				<form action="recipe_add" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label for="name" class="form-label">Recipe Name:</label> <input
							type="text" value="<%= resultset.getString(2) %>"
							class="form-control" id="name" name="name">
					</div>

					<div class="mb-3">
						<label for="publishedBy" class="form-label">Published By:</label>
						<input type="text" value="<%= resultset.getString(3) %>"
							class="form-control" id="publishedBy" name="publishedBy" required>
					</div>

					<div class="mb-3">
						<label for="category" class="form-label">Category:</label> <select
							class="form-select" id="category" name="category" required>
							<option value="Local Food"
								<%= resultset.getString(4).equals("Local Food") ? "selected" : "" %>>Local
								Food</option>
							<option value="Fast Food"
								<%= resultset.getString(4).equals("Fast Food") ? "selected" : "" %>>Fast
								Food</option>
							<option value="Beverages"
								<%= resultset.getString(4).equals("Beverages") ? "selected" : "" %>>Beverages</option>
							<option value="Sweets"
								<%= resultset.getString(4).equals("Sweets") ? "selected" : "" %>>Sweets</option>
						</select>
					</div>

					<div class="mb-3">
						<label for="description" class="form-label">Description:</label>
						<textarea class="form-control" id="description" name="description"
							rows="4" required><%= resultset.getString(5) %></textarea>
					</div>

					<div class="mb-3">
						<label for="image" class="form-label">Recipe Image:</label> <input
							type="file" class="form-control" id="image" name="image"
							value="<%= resultset.getString(6) %>" accept="image/*">
					</div>

					<button type="submit" class="btn btn-dark" name="btn_update"
						value="update">Update</button>
				</form>
				<% }
                } %>
			</div>
		</div>
	</div>
	<div class="container mt-4">
		<div class="row">
			<%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/recipeswap", "root", "");
                Statement statement = connection.createStatement();
                ResultSet resultset = statement.executeQuery("select * from addrecipes");
            %>
			<%
                while (resultset.next()) {
            %>
			<div class="card my-3 mx-3" style="width: 18rem;">
			<br>
				<img src="images/<%= resultset.getString(6) %>" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">
						Recipe Name:
						<%= resultset.getString(2) %></h5>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">Published by:<%= resultset.getString(3) %></li>
					<li class="list-group-item">Category:<%= resultset.getString(4) %></li>
					<li class="list-group-item">Procedure:<%= resultset.getString(5) %></li>
				</ul>
				
			</div>
			<%
                }
            %>
            
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>

</html>