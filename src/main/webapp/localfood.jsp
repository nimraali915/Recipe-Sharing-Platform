<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Local food</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<%@ include file="header.jsp" %>

          <%@ page import="java.sql.*"%>
        
	<%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/recipeswap", "root", "");
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from addrecipes");
            %>

	<div class="container mt-4">
<h1 class="container text-center mt-5">All Local Food</h1>
	<div class="row">

			<%
	while (resultset.next()) {
		if(resultset.getString(4).equals("Local Food")){
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

			<%} } %>
		</div>


	</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <%@ include file="footer.jsp" %>
</body>
</html>