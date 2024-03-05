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

.navbar-container {
	/* Adjust the margin to move the user icon towards the left */
	margin-right: 30px;
}

/* Change the font color of nav links to black */
.navbar-nav .nav-link {
	color: #000 !important;
}

.navbar-brand {
	color: #000 !important;
	   margin-right: 130px;
}

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid navbar-container">
			<a class="navbar-brand fw-bold fs-2" href="#">Admin Panel</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav mr-3">
					<li class="nav-item fs-4"><a class="nav-link active"
						aria-current="page" href="admin_home.jsp">Home</a></li>
					<li class="nav-item fs-4"><a class="nav-link"
						href="recpie.jsp">Recpies</a></li>
					<li class="nav-item fs-4"><a class="nav-link" href="user.jsp">Users</a>
					</li>
					<li class="nav-item fs-4"><a class="nav-link"
						href="messages.jsp">Messages</a></li>
					<li class="nav-item fs-4"><a class="nav-link"
						href="shared.jsp">Shared Recipe</a></li>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fas fa-user"></i>
						</a>

							<ul class="dropdown-menu" aria-labelledby="userDropdown">
								
								<li><a class=" btn btn-dark mx-5" href="logout">Logout</a></li>
							</ul></li>
					</ul>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
