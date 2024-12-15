<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forgot</title>
<link href="forgot.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if (session.getAttribute("usermail") == null) {
	response.sendRedirect("login.jsp");
}
%>
<div class="wrapper">
            <h2>Update Password</h2>
            <form action="forgetform" method="post">
                
                <div class="input-box">
                    <input type="text" placeholder="Enter your email" required name="email1">
                </div>
               
                <div class="input-box">
                    <input type="password" placeholder="Enter your password" required name="pass1">
                </div>
                
                <div class="input-box button">
                    <input type="Submit" value="Update">
                </div>
                
            </form>
        </div>
        
           <%
	   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    String msg = (String) request.getAttribute("message");
    if (msg != null) {
%>
<script>
    window.onload = function () {
        alert("<%= msg %>");
        if ("<%= msg %>".includes("Update SuccessFull")) {
            window.location.href = "forgot.jsp";
        }
    };
</script>
<%
    }
%>
</body>
</html>