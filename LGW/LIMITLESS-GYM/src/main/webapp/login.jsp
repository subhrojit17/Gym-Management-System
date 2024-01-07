<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="login.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>registration form</title>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
    <div class="wrapper">
        <form method="post" action="signin">
            <h1>Login</h1>
            <div class="input-box">
                <input type="email" placeholder="Email" name="uemail" id="uemail" required>
                <i class='bx bxs-mail'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" name="upwd" id="upwd" required>
                <i class='bx bxs-lock-alt' ></i>
            </div>
            <div class="remember-forgot">
                <label><input type="checkbox">Remember me</label>
                <a href="#">forgot password?</a>
            </div>
            <button type="submit" class="btn">Login</button>
            <div class="register-link">
                <p>Don't have an account?<a href="registration.jsp">Register</a></p>
            </div>
        </form>
    </div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	if (status == "failed") { 
		swal("Sorry", "Wrong Username or Password", "error");
	}
   	
	</script>
	</body>
</html>