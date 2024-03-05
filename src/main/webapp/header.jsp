<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<style>
.navbar-brand {
	margin-right: 130px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand fw-bold fs-2" href="#">RecipeSwap</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav mr-3 fs-4">

					<li class="nav-item "><a class="nav-link active"
						aria-current="page" href="home.jsp">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="recpie.php" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Recipes </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="all.jsp">All</a></li>
							<li><a class="dropdown-item" href="localfood.jsp">Local
									Food</a></li>
							<li><a class="dropdown-item" href="fastfood.jsp">Fast
									Food</a></li>
							<li><a class="dropdown-item" href="beverages.jsp">Beverages</a></li>
							<li><a class="dropdown-item" href="sweet.jsp">Sweets </a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="chef.jsp">Chefs</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact
							Us</a></li>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About
							Us</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fas fa-user"></i>
						</a>

							<ul class="dropdown-menu" aria-labelledby="userDropdown">
									
								</li>
								<li><a class=" btn btn-dark mx-5" href="logout">Logout</a></li>
					

							</ul></li>
					</ul>
				</ul>
			</div>


		</div>
	</nav>


</body>
</html>