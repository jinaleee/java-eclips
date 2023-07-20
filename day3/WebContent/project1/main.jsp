<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MANGCHI HOTEL</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
</head>
<style>
	#container {
		margin: 10px auto;
		width: 100%; 
		overflow: hidden; 
	}
	.img-container {
		display: block; 
		opacity: 0.8;
		margin-top: -32px;
		margin-bottom: -10px;
		margin-left:-10px;
		margin-right:-10px;
	}
	.img-container a img.darken {
		brightness: 20%; 
	}
	
	.swiper-slide {
		flex-shrink: 0;
		width: 100%;
	}
	img {
		width: 100%;
		height: auto;
		object-fit: cover;
	}
	body{
		overflow-x: hidden;
	}
</style>
<header>
    <jsp:include page="home.jsp" />
</header>
<body>
<%@ include file="../jdbc_set2.jsp" %>
<%	
		int mi = session.getMaxInactiveInterval()/60;
		session.setMaxInactiveInterval(60*60);
		
		String uId = (String) session.getAttribute("userId");
		String uName = (String) session.getAttribute("userName");
		String status = (String) session.getAttribute("status");
		%>
        <div class="img-container swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><a href="hotel.jsp"><img src="pool1.jpg"></a></div>
                <div class="swiper-slide"><a href="hotel.jsp"><img src="pool2.jpg"></a></div>
                <div class="swiper-slide"><a href="dining.jsp"><img src="res3.jpg"></a></div>
                <div class="swiper-slide"><a href="dining.jsp"><img src="res1.jpg"></a></div>
                <div class="swiper-slide"><a href="book.jsp" onclick="checkBooking()"><img src="room3.jpg"></a></div>
                <div class="swiper-slide"><a href="book.jsp" onclick="checkBooking()"><img src="room4.jpg"></a></div>
            </div>
        </div>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
	    // Swiper 초기화
	    var swiper = new Swiper('.swiper-container', {
	        loop: true,
	        autoplay: {
	            delay: 3500, 
	        },
	        slidesPerView: 'auto',
	        disableOnInteraction: true, 
	        speed: 800,
	    });
	</script>
</body>
</html>
<script>
function checkBooking() {
	event.preventDefault(); // 기본 동작(링크 이동) 막기
	
	<% if (uName != null) { %>
		location.href = "book.jsp";
	<% } else { %>
		alert("로그인 후 예약 가능합니다.");
	<% } %>
}
</script>