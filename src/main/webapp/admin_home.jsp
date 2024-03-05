<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="admin_style.css">
    <style>
        .card {
            background-color: #fff;
            color: #000; 
            margin-bottom: 20px; 
            width: 100%;
        }

        .title {
            color: #000;
        }
    </style>
</head>
<body>

<%@ include file="admin_header.jsp" %>

<section class="dashboard">

    <h1 class="title text-center">Dashboard</h1>

   	<header class="bg-dark text-white text-center" style="position: relative;">
        <!-- Replace 'your-image.jpg' with the path to your image -->
        <img src="images/f4.jpg" alt="Introductory Image" class="img-fluid">
        <div class="container  position-absolute top-50 start-50 translate-middle ">
            <div class="row">
                <div class="col-12 my-auto">
                    <h1 class="display-4 ">Welcome to RecepiSwap</h1>
                    <p class=" display-4lead color fs-3  ">"We warmly welcome you as an administrator to RecipeSwap." </p>
                    
                  <a class="btn btn-dark btn-lg" href="recpie.jsp" role="button">Get Started</a> 
                </div>
            </div>
        </div>
    </header>

</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>