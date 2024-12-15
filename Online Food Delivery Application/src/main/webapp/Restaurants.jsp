<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.Restaurant.Restaurant"%>
<%@ page import="java.util.List, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurants</title>
<style>
  body {
	margin: 0;
	padding: 0;
}

.navbar {
	background-color: black;
	position: fixed;
	width: 93%;
	margin: 10px 50px;
	border-radius: 7px;
	z-index: 1000;
	margin: -80px 45px;
}

ul li {
	list-style: none;
}

ul {
	display: flex;
	justify-content: space-evenly;
	height: 30px;
}

li {
	color: white;
	margin-top: 5px;
}

.icon {
	color: white;
	margin: -25px;
	margin-right: 280px;
}

.btnlogout {
	padding: 5px 20px;
	background-color: #f44336;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.btnlogout:hover {
	background-color: #e53935;
}

a {
	color: white;
	text-decoration: none;
}

a:hover {
	background-color: rgb(143, 129, 124);
}

    .cards-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        margin-top: 100px;
        padding: 20px;
    }

    .card {
        background-color: #fff;
        border-radius: 10px;
        width: 250px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        text-align: center;
        transition: transform 0.3s ease;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-bottom: 1px solid #ddd;
    }

    .card h4 {
        font-size: 1.4em;
        color: #333;
        margin: 10px 0;
    }

    .card p {
        font-size: 1.2em;
        color: #777;
        margin: 5px 0;
    }

    .card .vwbtn {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin: 10px 0;
        text-decoration: none;
    }

    .card .vwbtn:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("usermail") == null) {
        response.sendRedirect("login.jsp");
    }

    List<Restaurant> restaurantList = (List<Restaurant>) session.getAttribute("restaurantList");
%>

<div class="navbar">
    <ul>
        <div class="icon">
            <h3 style="cursor: pointer;" onclick="window.location.href='Homepage.jsp'">FoodApp</h3>
        </div>
        <li><a href="Homepage.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="blog.jsp">Blog</a></li>
        <li><a href="gallery.jsp">Gallery</a></li>
        <form action="logout" method="post">
            <button class="btnlogout">Logout</button>
        </form>
    </ul>
</div>

<div class="cards-container">
    <%
    if (restaurantList != null && !restaurantList.isEmpty()) {
        for (Restaurant restaurant : restaurantList) {
    %>
    <div class="card">
        <img src="<%= restaurant.getImage_url() %>" alt="<%= restaurant.getName() %> Image" />
        <h4><%= restaurant.getName() %></h4>
        <p>Rating: <%= restaurant.getRating() %></p>
        <form action="GetMenuItemsList" method="post">
            <input type="hidden" name="restaurantId" value="<%= restaurant.getId() %>">
            <button type="submit" class="vwbtn">View Menu</button>
        </form>
    </div>
    <%
        }
    } else {
    %>
    <p>No restaurants available.</p>
    <%
    }
    %>
</div>
</body>
</html>
