<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>contact us</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    
  </head>
  <body>
 <%@ include file="header.jsp" %>

<div class="container mt-5" id="contact">
    <div class="row">
        <!-- Contact Form Column -->
        <div class="col-md-6">
            <h2>Contact Us</h2>
            <form action="contact" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Your Name</label>
                    <input type="text" class="form-control" name="name" id="name" placeholder="Enter your name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" name="email" placeholder="name@example.com" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Your Message</label>
                    <textarea class="form-control" name="message" rows="4" placeholder="Type your message here" required></textarea>
                </div>
            <button type="submit" class="btn btn-dark">Submit</button>
            
            </form>
        </div>

        <!-- Additional Contact Information Column -->
        <div class="col-md-6">
            <h2>Share Your Recipes</h2>
           <form action="recpie_share" method="post">
    <input type="hidden" name="action" value="recipe"> <!-- Add this hidden input -->
    <div class="mb-3">
        <label for="rname" class="form-label">Recipe Name</label>
        <input type="text" class="form-control" name="rname" id="rname" required>
    </div>
    <div class="mb-3">
        <label for="foodType" class="form-label">Category</label>
        <select id="foodType" name="foodType" class="form-control">
            <option value="localFood">Local Food</option>
            <option value="fastFood">Fast Food</option>
            <option value="beverages">Beverages</option>
            <option value="sweets">Sweets</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="details" class="form-label">Details</label>
        <textarea class="form-control" name="details" id="details" rows="4" placeholder="Type your recipe here" required></textarea>
    </div>
   <button type="submit" class="btn btn-dark">Submit</button>

</form>
           
        </div>
    </div>
</div>


 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <%@ include file="footer.jsp" %>
  </body>
</html>