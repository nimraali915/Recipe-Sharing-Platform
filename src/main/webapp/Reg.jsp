<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
   <!-- Your head content here -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   
   <!-- Optional: Your custom CSS styles -->
   <link rel="stylesheet" href="your-custom-styles.css">

</head>
<body>
   <div class="container mt-5">
      <div class="row justify-content-center">
         <div class="col-md-6">
      
            <section class="form-container">
               <form action="submit" method="post">
                  <h3 class="mb-4">Register now</h3>
                  <div class="form-group">
                     <input type="text" name="name" class="form-control" placeholder="Enter your username" required>
                  </div>
                  <br>
                  <div class="form-group">
                     <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                  </div>
                   <br>
                  <div class="form-group">
                     <input type="password" name="pass" class="form-control" placeholder="Enter your password" required>
                  </div>
                   <br>
                  <div class="form-group">
                     <input type="password" name="cpass" class="form-control" placeholder="Confirm your password" required>
                  </div>
                   <br>
                  <button type="submit" class="btn btn-dark" name="btn-save" value="save">Register now</button>
                  <p class="mt-3">Already have an account? <a href="Log.jsp">Login now</a></p>
               </form>
            </section>
         </div>
      </div>
   </div>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  
  </body>
</html>
