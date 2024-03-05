<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
<title>Shared Recipes</title>
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


	<%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/recipeswap", "root", "");
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from contact_messages");
            %>

	<div class="container mt-4">
		<h3 class="text-center">Shared Recipe</h3>





		<div class="row">

			<%
	while (resultset.next()) {
	%>
			<div class="col-md-3 my-3 mx-3">


				<div class="card" style="width: 18rem;">
					<h3 class="text-center">
					<span class="badge rounded-pill bg-dark"><%= resultset.getString(1) %></span>
					</h3>
					<div class="card-body">
						<h5 class="card-title"> <%= resultset.getString(2) %></h5>
						<p class="card-text"><%= resultset.getString(3) %></p>
						<p class="card-text"><%= resultset.getString(4) %></p>
						<a href="#" class="btn btn-dark"><%= resultset.getString(5) %></a>
					</div>
				</div>

			</div>

			<% } %>
		</div>


	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>

</html>