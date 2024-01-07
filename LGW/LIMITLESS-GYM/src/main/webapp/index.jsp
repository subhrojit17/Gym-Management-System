<%@page import="com.entity.PlanDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.ConnectionProvider"%>
<%@page import="com.dao.PlandaoImp"%>
<%@page import="com.dao.PlanDao"%>
<%@page import="com.admin.PlansDeleteServlet"%>
<%@page import="java.awt.print.Book"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#plans {
	background-image: url(resources/bg.jpg);
	background-size: cover;
	color: #fff;
	margin: 0;
	padding: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.card {
	background: linear-gradient(#E43500, transparent);
	inset: 0;
	border-radius: 12px;
	border: 4px solid rgba(164, 161, 161, 0.2);
	border-radius: 20px;
	padding: 20px;
	margin: 20px;
	height: 450px;
	width: 400px;
	text-align: center;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease-in-out;
}

.card:hover {
	transform: scale(1.05);
}

.card h1 {
	color: #fff; /* Black */
	background-color: rgba(21, 1, 1, 0.443);
	padding: 13px;
}

.card p {
	color: #fff;
	margin: 0;
}
#priceAmt{
font-weight: bolder;

}
#priceAmt:hover{
transform:scale(1.04);}
.btn {
	display: block;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	background-color: white;
	color: black;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.btn:hover {
	background-color: rgba(0, 0, 0, 0.763);
	color: white;
	border: 1px solid rgba(255, 0, 0, 0.212);
}

@media only screen and (max-width: 600px) {
	/* Adjust styles for small screens */
	.card {
		width: 80%;
	}
}
</style>
</head>
<body>
	<link rel="stylesheet" href="style.css">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
		rel='stylesheet'>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
		integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="javascript" href="/javascript/menu.js">
	<title>Document</title>
</head>
<body>
	<!--landing page-->
	<header>
		<a href="" class="brand">LIMITLESS</a>
		<div class="menu-btn"></div>
		<div class="nav">
			<div class="navbar">
				<a href="about_us.jsp">About Us</a> <a href="#plans">Plans</a> <a
					href="#contact">Contact</a> <span id="namespan">Hi <%=session.getAttribute("name")%>!
				</span>
				<button class="login-popup" onclick="window.location.href='logout'">Logout</button>

			</div>
		</div>
	</header>

	<!--home design-->
	<section class="home">
		<video class="video-slide active" src="resources/athelete.mp4"
			autoplay muted loop></video>
		<video class="video-slide" src="resources/bodybuilding.mp4" autoplay
			muted loop></video>
		<video class="video-slide" src="resources/calisthenics.mp4" autoplay
			muted loop></video>
		<video class="video-slide" src="resources/yoga.mp4" autoplay muted
			loop></video>
		<video class="video-slide" src="resources/MMA.mp4" autoplay muted loop></video>


		<!--content div starts-->
		<div class="content active">
			<h1>
				Explore your<br> <span>Agility</span>
			</h1>
			<p>Explore your agility by embracing change, adapting to new challenges, and discovering the flexibility within yourself to navigate the dynamic landscapes of life</p>
			<a href="#">Read More</a>
		</div>
		<div class="content">
			<h1>
				Start<br> <span>Building</span>
			</h1>
			<p>Embark on the journey of creation and innovation by taking the first step to start building.</p>
			<a href="#">Read More</a>
		</div>
		<div class="content">
			<h1>
				Master<br> <span>Your Body</span>
			</h1>
			<p>Mastering your body involves cultivating a deep understanding of its capabilities and limitations, fostering a harmonious balance between physical strength, mental resilience, and overall well-being</p>
			<a href="#">Read More</a>
		</div>
		<div class="content">
			<h1>
				Explore<br> <span>Your soul</span>
			</h1>
			<p>Exploring your soul is a journey of self-discovery, a profound odyssey that unveils the depth of your inner being and the limitless possibilities within</p>
			<a href="#">Read More</a>
		</div>
		<div class="content">
			<h1>
				Learn<br> <span>MMA</span>
			</h1>
			<p>Learning Mixed Martial Arts (MMA) involves mastering a diverse set of martial disciplines, combining striking and grappling techniques for a comprehensive and versatile approach to self-defense or competitive sport.</p>
			<a href="#">Read More</a>
		</div>
		<!--content div ends-->



		<div class="media-icons">
			<a href="#"><i class='bx bxl-facebook'></i></a> <a href="#"><i
				class='bx bxl-instagram'></i></a> <a href="#"><i
				class='bx bxl-twitter'></i></a>
		</div>
		<div class="slider-nav">
			<div class="nav-btn active"></div>
			<div class="nav-btn"></div>
			<div class="nav-btn"></div>
			<div class="nav-btn"></div>
			<div class="nav-btn"></div>
		</div>
	</section>
	<!--home section design ends-->
	<!--Plans design starts here-->
	<section id="plans">
		<%
		PlanDao planDao = new PlandaoImp(ConnectionProvider.getConn());
		List<PlanDtls> plans = planDao.getAllPlans();
		request.setAttribute("plans", plans);
		%>
		<h2>Plans</h2>

		<%
		for (int i = 0; i < plans.size(); i++) {
		%>
		<div class="card">
			<h1>

				<%=plans.get(i).getPlanName()%></h1>
			<p>
				<br> <i class="fas fa-check"></i>
				<%=plans.get(i).getSpecification1()%></p>
			<p>
				<br> <i class="fas fa-check"></i>
				<%=plans.get(i).getSpecification2()%></p>
			<p>
				<br> <i class="fas fa-check"></i>
				<%=plans.get(i).getDuration()%></p>
			<p id="priceAmt">
				<br> <i class="fas fa-star"></i>
				<%=plans.get(i).getPrice()%></p>
			<br> <br>
			<br> <a href="buying.jsp?planId=<%=plans.get(i).getPlanId()%>"
				class="btn">Proceed</a>
		</div>
		<%
		}
		%>
		<!--plans section ends here-->
	</section>
	<!--contact form design-->
	<section class="contact" id="contact">
		<div class="content1">
			<h2>Contact Us</h2>
			<p>Welcome to LIMITLESS! We're here to assist you on your fitness
				journey and answer any questions you may have. Feel free to reach
				out to us using the following contact information:</p>

		</div>
		<div class="container1">
			<div class="contactInfo">
				<div class="box">
					<div class="icon">
						<i class="fa fa-map-marker" aria-hidden="true"></i>
					</div>
					<div class="text">
						<h3>Address</h3>
						<p>
							70, Beck Bagan Row 1st Floor,<br> Kolkata, West Bengal,<br>7000
							17
						</p>
					</div>
				</div>
				<div class="box">
					<div class="icon">
						<i class="fa fa-phone" aria-hidden="true"></i>
					</div>
					<div class="text">
						<h3>Phone</h3>
						<p>033-244-1139</p>
					</div>
				</div>
				<div class="box">
					<div class="icon">
						<i class="fa fa-envelope" aria-hidden="true"></i>
					</div>
					<div class="text">
						<h3>Email</h3>
						<p>limitlessofficial23@gmail.com</p>
					</div>
				</div>

			</div>
			<div class="contactForm">
				<form>
					<h2>Have a question or feedback?</h2>
					<div class="inputBox">
						<input type="text" name="fname" required>
						<span1> Full Name</span1>
					</div>
					<div class="inputBox">
						<input type="email" name="email" required>
						<span1>Email</span1>
					</div>
					<div class="inputBox">
						<textarea name="message" id="" required></textarea>
						<span1> Type your Message...</span1>
					</div>
					<div class="inputBox">
						<input type="submit" name="" value="Send">
					</div>
				</form>
			</div>
		</div>
	</section>
	<!--contact form ends here-->

	<!--footer section starts here-->
	<footer class="footer">
		<div class="footer-text">
			<p>Copyright &copy; 2023 by IB,SH,SDM,AG,SS,DP | All Rights
				Reserved.</p>
		</div>
		<div class="footer-iconTop">
			<a href="#"><i class='bx bx-up-arrow-alt'></i></a>
		</div>
	</footer>
	<!--javascript starts here-->
	<script type="text/javascript">
    const menuBtn=document.querySelector(".menu-btn");
    const nav=document.querySelector(".nav");
    menuBtn.addEventListener("click",()=>{
    menuBtn.classList.toggle("active");
    nav.classList.toggle("active");
    });
    //javascript for slider
    const btns=document.querySelectorAll(".nav-btn");
    const slides=document.querySelectorAll(".video-slide");
    const content=document.querySelectorAll(".content");

    var sliderNav = function(manual){
        btns.forEach((btn)=>{
            btn.classList.remove("active");
        });
        slides.forEach((slide)=>{
            slide.classList.remove("active");
        }); 
        content.forEach((content)=>{
            content.classList.remove("active");
        }); 


        btns[manual].classList.add("active");
        slides[manual].classList.add("active");
        content[manual].classList.add("active");
    }

    btns.forEach((btn,i)=>{
        btn.addEventListener("click",()=>{
            sliderNav(i);
        });
    });
    </script>
	<script src="https://kit.fontawesome.com/c32adfdcda.js"
		crossorigin="anonymous"></script>
</body>
</html>
