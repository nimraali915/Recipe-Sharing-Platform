<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!doctype html>
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


<!-- About Us Section with Bootstrap -->
<div class="container mt-5" id="about">
    <h2 class="text-center mb-4">About Us</h2>
  
    <!-- Mission Section -->
    <section>
        <div class="row">
            <div class="col-lg-6">
                <h3>Our Mission</h3>
                <p class="fs-4">
                    Welcome to RecipeSwap, where our mission is to create a global community of food enthusiasts 
                    by sharing delightful recipes from around the world. We believe that the joy of cooking and the 
                    pleasure of savoring homemade meals should be accessible to everyone.
                </p>
            </div>
            
            <div class="col-lg-6">
                
              <img src="images/f1.jpg" alt="Mission Image" class="img-fluid"> 
            </div>
        </div>
    </section>
    
    <!-- Vision Section -->
    <section class="mt-4">
        <div class="row">
            <div class="col-lg-6 order-lg-2">
            <img src="images/f2.jpg" alt="Vision Image" class="img-fluid"> 
            </div>
            
            <div class="col-lg-6 order-lg-1">
                <h3>Our Vision</h3>
                <p class="fs-4">
                    At RecipeSwap, we envision a world where the art of cooking is celebrated by individuals 
                    of all backgrounds. Our platform aims to inspire creativity in the kitchen, foster cultural exchange, 
                    and build connections through the shared love of food.
                </p>
            </div>
        </div>
    </section>
</div>

     
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <%@ include file="footer.jsp" %>
  </body>
</html>
    