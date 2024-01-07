<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="registration.css">
<title>Insert title here</title>
</head>
<body>
    <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
    <div class="wrapper">
        <form method="post" action="register">
            <h1>Register</h1>
            <div class="input-box">
                <input type="text" placeholder="Username" name="name" id="name" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" name="password" id="pass" required> 
                <i class='bx bxs-lock-alt' ></i>
            </div>
            <div class="input-box">
                <input type="email" placeholder="Email" name="email" id="email" required>
                <i class='bx bxs-envelope' ></i>
            </div>
            <div class="input-box">
                <input type="ph-no" placeholder="Phone number" name="contact" id="contact" required>
                <i class='bx bxs-phone' ></i>
            </div>

            <button type="submit" class="btn">Register</button>
            <div class="register-link">
                <p>already have an account?
                <p><a href="index.jsp">Back to home page</a></p>
            </div>
        </form>
    </div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script type="text/javascript">
        var status = document.getElementById("status").value;
        if(status == "success"){
            swal("Congrats","Account Created Successfully","success");
        }
    </script>
  
</body>
</html>