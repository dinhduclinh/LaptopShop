<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Manager</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #000;
            font-family: Arial, sans-serif;
        }
        
        .container {
            margin-top: 50px;
        }
        
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="font-weight-bold text-uppercase mb-3 text-center">Bill Manager</h1>
        
        <c:if test="${not empty billDetailForAdmins}">
            <div class="mb-4">
                <h5 class="font-weight-bold mb-3">Filter by Status</h5>
                <form>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" name="status" id="all" onchange="filterStatus(this.id)">
                        <label class="form-check-label" for="all">All Status</label>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" name="status" id="wait" onchange="filterStatus(this.id)">
                        <label class="form-check-label" for="wait">Wait</label>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" name="status" id="process" onchange="filterStatus(this.id)">
                        <label class="form-check-label" for="process">Process</label>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" name="status" id="done" onchange="filterStatus(this.id)">
                        <label class="form-check-label" for="done">Done</label>
                    </div>
                </form>
            </div>
            
            <div class="table-responsive">
                <table class="table table-bordered text-center mb-5">
                    <thead class="bg-secondary text-white">
                        <tr>
                            <th>ID</th>
                            <th>Customer Name</th>
                            <th>Created Date</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Show Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${billDetailForAdmins}" var="b">
                            <tr>
                                <td>${b.id}</td>
                                <td>${b.customerName}</td>
                                <td>${b.created_date}</td>
                                <td>${b.address}</td>
                                <td>${b.email}</td>
                                <td>${b.phone}</td>
                                <td>$${Math.round(b.total)*1.0}</td>
                                <td>${b.status}</td>
                                <td><a href="manageBill?service=showDetailBill&billId=${b.id}&status=${b.status}">Show Detail</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        
        <c:if test="${not empty billDetails}">
            <div class="table-responsive">
                <table class="table table-bordered text-center mb-5">
                    <thead class="bg-secondary text-white">
                        <tr>
                            <th>BillID</th>
                            <th>Customer Name</th>
                            <th>Created Date</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>SubTotal</th>
                            <th>Bill Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="total" value="0" />
                        <c:forEach var="billDetail" items="${billDetails}">
                            <tr>
                                <td>${billDetail.id}</td>
                                <td>${billDetail.customerName}</td>
                                <td>${billDetail.created_date}</td>
                                <td>${billDetail.productName}</td>
                                <td>${billDetail.productQuantity}</td>
                                <td>$${Math.round(billDetail.subTotal)*1.0}</td>
                                <td>${billDetail.status}</td>
                            </tr>
                            <c:set var="subtotal" value="${billDetail.subTotal}" />
                            <c:set var="total" value="${total + subtotal}" />
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        
        <c:if test="${changeStatus ne null}">
            <div class="text-center">
                <h3 class="font-weight-bold">${changeStatus}</h3>
            </div>
        </c:if>
    </div>
    
    <script>
        function filterStatus(value) {
            const urlParams = new URLSearchParams(window.location.search);
            let service = urlParams.get('service');
            
            if (service === null) {
                service = "filterStatus";
            }
            
            window.location.href = "manageBill?service=" + service + "&filter=" + value;
        }
    </script>
</body>
</html>