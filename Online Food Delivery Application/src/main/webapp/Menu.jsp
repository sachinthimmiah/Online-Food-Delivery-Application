<%@ page import="java.util.List"%>
<%@ page import="GetMenuitems.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	margin: -40px 45px;
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
	gap: 20px;
	margin: 50px;
	justify-content: space-around;
	margin-top: 55px;
}

.card1 {
	display: flex;
	align-items: center;
	width: 600px;
	border: 1px solid #ccc;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	background-color: #fff;
	margin-top: 50px;
}

.image {
	width: 200px;
	height: 200px;
	border-radius: 8px;
	object-fit: cover;
	margin-right: 20px;
}

.card-content {
	flex: 1;
}

.card-content h3 {
	font-size: 1.5em;
	color: #333;
	margin: 0 0 10px 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	max-width: 100%;
}

.card-content h4 {
	font-size: 1.2em;
	color: #666;
	margin: 10px 0;
}

.vwbtn {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.vwbtn:hover {
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
	List<Menu> menulist = (List<Menu>) session.getAttribute("menulist");
	%>

	<div class="navbar">
		<ul>
			<div class="icon">
				<h3 style="pointer: cursor;"
					onclick="window.location.href='Homepage.jsp'">FoodApp</h3>
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
		if (menulist != null && !menulist.isEmpty()) {
		%>
		<%
		for (Menu item : menulist) {
		%>
		<div class="card1">
			<img src="<%=item.getImage_url()%>" alt="<%=item.getName()%> Image"
				class="image" />
			<div class="card-content">

				<h2><%=item.getName()%></h2>
				<h6><%=item.getDescription()%></h6>

				<h4>
					Price :
					<%=item.getPrice()%></h4>
				<form action="CartItem" method="post">
					<label for="quantity">Select Quantity:</label> <select
						id="quantity" name="quantity">
						<option value="1">Select Quantity</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select> <input type="hidden" name="itemid" value="<%=item.getMenuid()%>">
					<button type="submit" class="vwbtn">Add to cart</button>
				</form>
			</div>
		</div>
		<%
		}
		%>
		<%
		} else {
		%>
		<p>No Menu available.</p>
		<%
		}
		%>
	</div>
</body>
</html>