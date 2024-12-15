<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="in.Restaurant.Restaurant"%>
<%@ page import="java.util.List, java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Home</title>
<link href="Homestyle.css" rel="stylesheet" type="text/css">
<script src="Homescript.js"></script>
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
			<div class="icon" >
				<h3 style="pointer:cursor;" onclick="window.location.href='Homepage.jsp'">FoodApp</h3>
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
	<div class="scrolling-wrapper">
		<div class="card" onclick="window.location.href='Restaurants.jsp';">
		<h3>Food Delivery</h3>
		</div>
		<div class="card" onclick="window.location.href='./Food (7).jpg';">
		<h3>Insta Mart</h3></div>
	</div>
	<div class="fooditems">
		<h2>Order our Best Food Options</h2>
		<div class="scroll-container">
			<div class="card1">
			<img src="https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili_2829-19992.jpg?t=st=1734155529~exp=1734159129~hmac=24e516a674ec2737040a1d55a3cbce9be6dbfe3b8e5d9813824d2d39bd8e126a&w=996">
			</div>
			<div class="card1">
				<img src="https://img.freepik.com/premium-photo/bowl-food-with-side-vegetables-spices_890138-445.jpg?w=740">
			</div>
			<div class="card1">
				<img src="https://img.freepik.com/free-photo/traditional-azerbaijani-meat-gutab-minced-meat-stuffed-flatbread-served-with-sumac_140725-5219.jpg?ga=GA1.1.1372481749.1733400557&semt=ais_hybrid">
			</div>
			<div class="card1">
				<img src="https://img.freepik.com/free-photo/pizza-pizza-filled-with-tomatoes-salami-olives_140725-1200.jpg?ga=GA1.1.1372481749.1733400557&semt=ais_hybrid">
			</div>
			<div class="card1">
				<img src="https://img.freepik.com/premium-photo/dum-handi-chicken-biryani-is-prepared-earthen-clay-pot-called-haandi-popular-indian-non-vegetarian-food_466689-52348.jpg?ga=GA1.1.1372481749.1733400557&semt=ais_hybrid">
			</div>
			<div class="card1">
				<img src="https://img.freepik.com/premium-photo/onion-rava-masala-dosa-is-south-indian-instant-breakfast-served-with-chutney-sambar-moody-background-selective-focus_466689-31688.jpg?ga=GA1.1.1372481749.1733400557&semt=ais_hybrid">
			</div>
			<div class="card1">
				<img src="https://img.freepik.com/premium-photo/curd-rice-dahi-bhat-chawal-with-curry-leaf-peanuts-chilli-served-bowl-moody-background-selective-focus_466689-59423.jpg?ga=GA1.1.1372481749.1733400557&semt=ais_hybrid">
			</div><div class="card1">
				<img src="https://media.istockphoto.com/id/1488737992/photo/upma-recipe-suji-ka-upma-rava-upma-with-red-and-coconut-chutney.jpg?s=2048x2048&w=is&k=20&c=DPxyBb3cAyA8UOKNS37OuNIxykrFLS04Y4cGzdInIbA=">
			</div>
			<div class="card1">
				<img src="https://media.istockphoto.com/id/1488737991/photo/goli-baje-recipe-mangalore-bajji-recipe-mangalore-bonda-maida-bonda-with-green-chutney.jpg?s=612x612&w=0&k=20&c=PsvY8L0zG__y5pI-nIgNjJOBEhgN21pX4HgSjJcxO8Q=">
			</div>
			
			<div class="card1">
				<img src="https://media.istockphoto.com/id/2162493403/photo/selective-focus-of-idli-food-made-with-fermented-rice-popular-in-south-india-serve-with-green.jpg?s=612x612&w=0&k=20&c=H7M1bGNtzeelton2dDuwhh6DjfN-cH6nuRnaBiQC6gg=">
			</div><div class="card1">
				<img src="https://media.istockphoto.com/id/1411646705/photo/chicken-tikka-masala-cooked-marinated-chicken-in-spiced-curry-sauce.jpg?s=612x612&w=0&k=20&c=7TxsOFPxJynG6oXKALqDRsV-ni9UsRx3TUil-fJnWfk=">
			</div>
			<div class="card1">
				<img src="https://media.istockphoto.com/id/1169098788/photo/masala-vada-spicy-fried-fritters.jpg?s=612x612&w=0&k=20&c=Rp_h-1c3vz0ldTZfEnsQ6mlTfhQR50JBeHvLCu4rj0E=">
			</div> 
		</div>

		<h2>Discover Best Restraurants</h2>
		<div class="scroll-container1">

			<%
			if (restaurantList != null && !restaurantList.isEmpty()) {
			%>
			<%
			for (Restaurant restaurant : restaurantList) {
			%>
			<div class="card1">
				<img src="<%=restaurant.getImage_url()%>"
					alt="<%=restaurant.getName()%> Image" width="150" class="restimge" />

				<h4><%=restaurant.getName()%></h4>

				<p>
					Rating:
					<%=restaurant.getRating()%></p>


				<form action="GetMenuItemsList" method="post">
            <input type="hidden" name="restaurantId" value="<%= restaurant.getId() %>">
            <button type="submit" class="vwbtn">View Menu</button>
        </form>
			</div>
			<%
			}
			%>
			<%
			} else {
			%>
			<p>No restaurants available.</p>
			<%
			}
			%>
		</div>
	</div>
	   <div class="footer">
            <div class="griddd">
                <h3>Company</h3>
                <ul class="footer-list-custom">
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">About</a>
                    </li>
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">Careers</a>
                    </li>
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">Team</a>
                    </li>
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">Blog</a>
                    </li>
                </ul>
            </div>
            <div class="griddd">
                <h3>Legal</h3>
                <ul class="footer-list-custom">
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">Terms</a>
                    </li>
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">Cookie Policy</a>
                    </li>
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">Privacy Policy</a>
                    </li>
                </ul>
            </div>
            <div class="company">
                <h3>Connect</h3>
                <ul class="footer-list-custom">
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">Facebook</a>
                    </li>
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">Twitter</a>
                    </li>
                    <li class="footer-item-custom">
                        <a href="#" class="footer-link-custom">Instagram</a>
                    </li>
                </ul>
            </div>
            <div>
                <p>&copy; 2024 Food App</p>
            </div>
        </div>
	<script>
		function logout() {
			window.location.href = "login.jsp";
		}
	</script>
</body>
</html>