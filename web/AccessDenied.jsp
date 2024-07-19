<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Denied</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #212529;
            color: #ffffff;
            font-family: Arial, sans-serif;
        }
        
        .container {
            text-align: center;
            margin-top: 100px;
        }
        
        .error-code {
            font-size: 72px;
            color: #dc3545;
            margin-bottom: 30px;
        }
        
        .error-message {
            font-size: 24px;
            margin-bottom: 20px;
        }
        
        .error-description {
            font-size: 18px;
            margin-bottom: 40px;
        }
        
        .back-to-shop {
            color: #ffffff;
            font-size: 18px;
            text-decoration: none;
        }
        
        .back-to-shop:hover {
            color: #ffffff;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-code">403</div>
        <div class="error-message">Access Denied</div>
        <div class="error-description">You don't have permission to view this site. <br> (Or your account is banned)</div>
        <div class="error-icon">🚫🚫🚫🚫</div>
        <div class="error-code-description">Error Code: 403 Forbidden</div>
        <a href="customer" class="back-to-shop"><-- Back to Shop</a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.6.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>