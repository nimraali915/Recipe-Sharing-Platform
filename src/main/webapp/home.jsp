<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <%@ include file="header.jsp" %>
    <header class="bg-dark text-white text-center" style="position: relative;">
        <!-- Replace 'your-image.jpg' with the path to your image -->
        <img src="images/f3.jpg" alt="Introductory Image" class="img-fluid">
        <div class="container  position-absolute top-50 start-50 translate-middle ">
            <div class="row">
                <div class="col-12 my-auto">
                    <h1 class="display-4 ">Welcome to RecepiSwap</h1>
                    <p class=" display-4lead color fs-3  ">Discover, Share, and Create Delicious Recipes with Our Global Community</p>
                    
                  <a class="btn btn-dark btn-lg" href="all.jsp" role="button">Get Started</a> 
                </div>
            </div>
        </div>
    </header>
     <section class="container mt-5">
        <h2 class="text-center mb-4">Most Popular Recipes</h2>
          <%@ page import="java.sql.*"%>
        
	<%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/recipeswap", "root", "");
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from addrecipes");
            %>

	<div class="container mt-4">

	<div class="row">

			<%
	while (resultset.next()) {
	%>
  <div class="card my-3 mx-3" style="width: 18rem; ">
  <img src="images/<%= resultset.getString(6) %>" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Recipe Name: <%= resultset.getString(2) %></h5>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Published by:<%= resultset.getString(3) %></li>
    <li class="list-group-item">Category:<%= resultset.getString(4) %></li>
    <li class="list-group-item">Procedure:<%= resultset.getString(5) %></li>
  </ul>
</div>

			<% } %>
		</div>


	</div>
    
        
       
    </section>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <%@ include file="footer.jsp" %>
</body>
</html>
