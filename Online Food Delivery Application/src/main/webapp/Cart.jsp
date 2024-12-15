<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        .cart-container {
            width: 90%;
            margin: 20px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table th, .cart-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .cart-table th {
            background-color: #f7f7f7;
            font-weight: bold;
            text-transform: uppercase;
            color: #555;
        }

        .cart-table tr:nth-child(odd) {
            background-color: #fdfdfd;
        }

        .cart-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .cart-table tr:hover {
            background-color: #f1f1f1;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .actions form button {
            background-color: #ff5722;
            color: #fff;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .actions form button:hover {
            background-color: #e64a19;
        }

        .bill-summary {
            padding: 20px;
            border-top: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f7f7f7;
        }

        .bill-summary div {
            font-size: 18px;
            font-weight: bold;
        }

        .bill-summary .total-price {
            font-size: 24px;
            color: #ff5722;
        }

        .empty-cart {
            text-align: center;
            padding: 20px;
            color: #555;
        }

        .checkout-button {
            text-align: right;
            padding: 10px 20px;
            background-color: #fff;
            border-top: 1px solid #ddd;
        }

        .checkout-button button {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            font-size: 18px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .checkout-button button:hover {
            background-color: #388e3c;
        }
        
        button.btn2 {
    background-color: red;
    padding: 8px;
     color: white;
    border-radius: 6px;
    cursor:pointer;
}
button.btn1 {
    background-color: #8ce78c;
    color: white;
    padding: 7px;
    border-radius: 6px;
     cursor:pointer;
}
    </style>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if (session.getAttribute("usermail") == null) {
	response.sendRedirect("login.jsp");
}
%>
    <h2>Your Shopping Cart</h2>
    <div class="cart-container">
        <c:choose>
            <c:when test="${not empty sessionScope.cart}">
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Restaurant</th>
                            <th>Quantity</th>
                            <th>Price (Per Item)</th>
                            <th>Total Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="grandTotal" value="0" />
                        <c:forEach var="item" items="${sessionScope.cart.values()}">
                            <tr>
                                <td>${item.name}</td>
                                <td>${item.restid}</td>
                                <td>
                                    <form action="cartmodify" method="POST" class="actions">
                                        <input type="number" name="quantity" value="${item.quantity}" min="1" max="7" style="width: 60px;" />
                                        <input type="hidden" name="itemid" value="${item.itemid}" />
                                        <input type="hidden" name="action" value="update" />
                                        <button class="btn1" type="submit">Update</button>
                                    </form>
                                </td>
                             <td>₹<fmt:formatNumber value="${item.price}" type="number" maxFractionDigits="2" /></td>
            <td>₹<fmt:formatNumber value="${item.price * item.quantity}" type="number" maxFractionDigits="2" /></td>
                                <td>
                                    <form action="cartmodify" method="POST">
                                        <input type="hidden" name="itemid" value="${item.itemid}" />
                                        <input type="hidden" name="action" value="delete" />
                                        <button class="btn2" type="submit">Delete</button>
                                    </form>
                                </td>
                            </tr>
                            <c:set var="grandTotal" value="${grandTotal + (item.price * item.quantity)}" />
                        </c:forEach>
                    </tbody>
                </table>
                <div class="bill-summary">
                   <div>Grand Total:</div>
    <div class="total-price">₹<fmt:formatNumber value="${grandTotal}" type="number" maxFractionDigits="2" /></div>
                </div>
    <div class="checkout-button">
    <form action="placeOrder" method="POST">
        <button type="submit">Place Order</button>
    </form>
</div>
    
            </c:when>
            <c:otherwise>
                <div class="empty-cart">
                    <p>Your cart is empty. Start adding items to it!</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <% 
    String msg = (String) request.getAttribute("message");
    if (msg != null) {
%>
    <script>
        window.onload = function () {
            alert("<%= msg %>");
        };
    </script>
<% 
    }
%>
    
</body>
</html>
