<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Manager</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .product-manager-title {
            text-align: center;
            margin-top: 20px;
        }
        .message {
            text-align: center;
            margin-top: 20px;
        }
        .insert-product-btn {
            display: block;
            width: 25%;
            margin: 20px auto;
            text-align: center;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-form {
            text-align: center;
            margin-bottom: 20px;
        }
        .search-input {
            width: 60%;
            margin-right: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .search-button {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .product-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .product-table th, .product-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .product-image {
            width: 50px;
        }
        .update-link, .delete-link {
            text-decoration: none;
            color: blue;
        }
        .update-form, .insert-form {
            margin: 20px auto;
            width: 80%;
        }
        .update-btn, .insert-btn {
            display: block;
            width: 100%;
            margin-top: 20px;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1 class="product-manager-title">Products Manager</h1>

    <!--Insert a new product-->
    <a href="manageProduct?service=requestInsert" class="insert-product-btn">Insert a new Product</a>

    <!--Search product by name-->
    <c:if test="${showSearchProduct ne null}">
        <form action="manageProduct" class="search-form">
            <input type="hidden" name="service" value="searchByKeywords"/>
            <input type="text" class="search-input" placeholder="Search by name" name="keywords" value="${keywords}" />
            <button class="search-button" type="submit">
                <i class="fa fa-search"></i>
            </button>
        </form>            
    </c:if>

    <!--Display messages-->
    <c:if test="${notFoundProduct ne null || deleteDone ne null}">
        <h4 class="message">${notFoundProduct}${deleteDone}</h4>
    </c:if>

    <!--List all Product-->
    <c:if test="${not empty allProducts}">
        <div class="table-responsive">
            <table class="product-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product Name</th>
                        <th>Unit Price</th>
                        <th>Quantity In Stock</th>
                        <th>Release Date</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allProducts}" var="product">
                        <tr>
                            <td>${product.id}</td>
                            <td>
                                <img src="${product.image_url}" alt="" class="product-image" />
                                ${product.name}
                            </td>
                            <td>${product.price}</td>
                            <td>${product.quantity}</td>
                            <td>${product.release_date}</td>
                            <td>
                                <a href="manageProduct?service=requestUpdate&productId=${product.id}" class="update-link">Update</a>
                            </td>
                            <td>
                                <a href="manageProduct?service=requestDelete&productId=${product.id}" class="delete-link" onclick="return confirmDelete(${product.id})">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script>
            function confirmDelete(productId) {
                return confirm("Are you sure you want to delete this Product (ID = " + productId + ") ?");
            }
        </script>
    </c:if>
    <!--List all Product End-->

    <!--Update Product-->
    <c:if test="${UpdateDone ne null}">
        <h3 class="message">${UpdateDone}</h3>
    </c:if>
    <c:if test="${productUpdate ne null}">
        <h1 class="product-manager-title">Update Product</h1>
        <form action="manageProduct" method="post" class="update-form">
            <input type="hidden" name="service" value="sendUpdateDetail" />
            <div class="table-responsive">
                <table class="product-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Unit Price</th>
                            <th>Quantity In Stock</th>
                            <th>Release Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" name="id" value="${productUpdate.id}" readonly />
                            </td>
                            <td>
                                <input type="text" name="name" value="${productUpdate.name}" />
                            </td>
                            <td>
                                <input type="number" name="price" value="${productUpdate.price}" />
                            </td>
                            <td>
                                <input type="number" name="quantity" value="${productUpdate.quantity}" />
                            </td>
                            <td>
                                <input type="text" name="release_date" value="${productUpdate.release_date}" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <button type="submit" class="update-btn">Update</button>
        </form>
    </c:if>
    <!--Update Product End-->

    <!--Insert Product-->
    <c:if test="${InsertDone ne null}">
        <h3 class="message">${InsertDone}</h3>
    </c:if>
    <c:if test="${insertProduct ne null}">
        <h1 class="product-manager-title">Insert a new Product</h1>
        <form action="manageProduct" method="post" class="insert-form">
            <input type="hidden" name="service" value="sendInsertDetail" />
            <div class="table-responsive">
                <table class="product-table">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Unit Price</th>
                            <th>Quantity In Stock</th>
                            <th>Description</th>
                            <th>Image Url</th>
                            <th>Brand</th>
                            <th>Release Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" name="name" />
                            </td>
                            <td>
                                <input type="number" name="price" />
                            </td>
                            <td>
                                <input type="number" name="quantity" />
                            </td>
                            <td>
                                <input type="text" name="description" />
                            </td>
                            <td>
                                <input type="text" name="image_url" />
                            </td>
                            <td>
                                <select name="brand">
                                    <c:forEach items="${allBrands}" var="brand">
                                        <option value="${brand.id}">${brand.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <input type="text" name="release_date" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <button type="submit" class="insert-btn">Add</button>
        </form>
    </c:if>
    <!--Insert Product End-->
</body>
</html>