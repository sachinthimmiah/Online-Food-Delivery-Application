<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
body{
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
 background-image: url(https://img.freepik.com/premium-photo/top-view-table-full-food_23-2149209248.jpg?ga=GA1.1.1372481749.1733400557);
 background-size: cover;
}
.wrapper{
  position: relative;
  max-width: 430px;
  width: 100%;
  background: #fff;
  padding: 34px;
  border-radius: 6px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.2);
}
.wrapper h2{
  position: relative;
  font-size: 22px;
  font-weight: 600;
  color: #333;
}
.wrapper h2::before{
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 28px;
  border-radius: 12px;
  background: #4070f4;
}
.wrapper form{
  margin-top: 30px;
}
.wrapper form .input-box{
  height: 52px;
  margin: 18px 0;
}
form .input-box input{
  height: 100%;
  width: 100%;
  outline: none;
  padding: 0 15px;
  font-size: 17px;
  font-weight: 400;
  color: #333;
  border: 1.5px solid #C7BEBE;
  border-bottom-width: 2.5px;
  border-radius: 6px;
  transition: all 0.3s ease;
}
.input-box input:focus,
.input-box input:valid{
  border-color: #4070f4;
}
form .policy{
  display: flex;
  align-items: center;
}
form h3{
  color: #707070;
  font-size: 14px;
  font-weight: 500;
  margin-left: 10px;
}
.input-box.button input{
  color: #fff;
  letter-spacing: 1px;
  border: none;
  background: #4070f4;
  cursor: pointer;
}
.input-box.button input:hover{
  background: #0e4bf1;
}
form .text h3{
 color: #333;
 width: 100%;
 text-align: center;
}
form .text h3 a{
  color: #4070f4;
  text-decoration: none;
}
form .text h3 a:hover{
  text-decoration: underline;
}

</style>
</head>
<body>
 <div class="wrapper">
            <h2>Registration</h2>
            <form  action="registerform"  method="post">
                <div class="input-box">
                    <input type="text" placeholder="Enter your name" required name="name">
                </div>
                <div class="input-box">
                    <input type="text" placeholder="Enter your email" required name="email">
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Create password" required name="password">
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Confirm password" required  name="password1">
                </div>
                <div class="policy">
                    <input type="checkbox">
                    <h3>I accept all terms & condition</h3>
                </div>
                <div class="input-box button">
                    <input type="Submit" value="Register Now">
                </div>
                <div class="text">
                    <h3>Already have an account?
                        <a href="login.jsp">Login now</a>
                    </h3>
                </div>
            </form>
        </div>
        <script>
        <%
        String msg = (String) request.getAttribute("message");
        if (msg != null) {
    %>
        window.onload = function () {
            alert("<%= msg %>");
            if ("<%= msg %>".includes("SuccessFull")) {
            	window.location.href = "Register.jsp";
            }
        };
        

    <%
        }
    %>
        
        </script>
</body>
</html>