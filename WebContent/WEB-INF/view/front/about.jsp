<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/index.jsp" %>
<!DOCTYPE html>
<html lang="kr">

<head>
	<%@ include file="/include/common/header.jsp" %>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__option">
			<div class="offcanvas__links">
				<a href="#">Sign in</a>
				<a href="#">FAQs</a>
			</div>
			<div class="offcanvas__top__hover">
				<span>Usd <i class="arrow_carrot-down"></i></span>
				<ul>
					<li>USD</li>
					<li>EUR</li>
					<li>USD</li>
				</ul>
			</div>
		</div>
		<div class="offcanvas__nav__option">
			<a href="#" class="search-switch"><img src="/img/icon/search.png" alt=""></a>
			<a href="#"><img src="/img/icon/heart.png" alt=""></a>
			<a href="#"><img src="/img/icon/cart.png" alt=""> <span>0</span></a>
			<div class="price">$0.00</div>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__text">
			<p>Free shipping, 30-day return or refund guarantee.</p>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
			<header>
		<%@ include file="/include/common/header.jsp" %>
	</header>
	<header class="header">
		<%@ include file="/include/common/top.jsp" %>
	</header>
	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>About Us</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a>
							<span>About Us</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- About Section Begin -->
	<section class="about spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="about__pic">
						<img src="/img/about/about-us.jpg" alt="">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="about__item">
						<h4>Vision&Mission</h4>
						<p>우리는 패션의 다양성을 즐기고, 누구나 자신만의 <br>스타일을 찾을 수 있도록 돕는 것을 목표로 합니다.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="about__item">
						<h4>Customer Focus</h4>
						<p>고객님의 소중한 취향을 존중하며, 합리적인 가격에 <br>독특한 아이템을 제공하고자 합니다.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="about__item">
						<h4>Auction System</h4>
						<p>우리는 단순한 쇼핑을 넘어, 즐거운 경매 경험을 통해 특별한 패션 아이템을 만나볼 기회를 제공합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section End -->

	<!-- Testimonial Section Begin -->
	<section class="testimonial">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 p-0">
					<div class="testimonial__text">
						<!--<span class="icon_quotations"></span>-->
						<p>챌린지팜은 단순한 쇼핑 플랫폼을 넘어, 고객이 경매에 참여하여 색다른 <br> 경험과 성취감을 느낄 수 있는 도전의 장입니다. 우리는 고객의 기대를 <br> 뛰어넘는 특별한 경험을 제공하기 위해 항상 노력하며, <br> 여러분의 패션 여정을 함께하는 것을 기쁘게 생각합니다.<br>  도전과 발견의 여정에 여러분을 초대합니다.
						</p>
						 
						<div class="testimonial__author"> 
							<div class="testimonial__author__pic"> 
								<!--<img src="/img/about/testimonial-author.jpg" alt="">-->
							</div>
							<div class="testimonial__author__text">
								<h5>Challengefarm</h5>
								<!--<p>Fashion Design</p>-->
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 p-0">
					<div class="testimonial__pic set-bg" data-setbg="/img/about/testimonial-pic.jpg"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- Testimonial Section End -->

	<!-- Counter Section Begin -->
	<!--
	<section class="counter spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="counter__item">
						<div class="counter__item__number">
							<h2 class="cn_num">102</h2>
						</div>
						<span>Our <br />Clients</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="counter__item">
						<div class="counter__item__number">
							<h2 class="cn_num">30</h2>
						</div>
						<span>Total <br />Categories</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="counter__item">
						<div class="counter__item__number">
							<h2 class="cn_num">102</h2>
						</div>
						<span>In <br />Country</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="counter__item">
						<div class="counter__item__number">
							<h2 class="cn_num">98</h2>
							<strong>%</strong>
						</div>
						<span>Happy <br />Customer</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	-->
	<!-- Counter Section End -->

	<!-- Team Section Begin -->
	<section class="clients spad" style="padding-top: 150px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<!--  
						<span>Partner</span>
						-->
						<h2>Partnership</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<a href="#" class="client__item"><img src="/img/clients/BEANPORE.png" alt=""></a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<a href="#" class="client__item"><img src="/img/clients/8seconds.png" alt=""></a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<a href="#" class="client__item"><img src="/img/clients/LACOSTE.png" alt=""></a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<a href="#" class="client__item"><img src="/img/clients/LEVI'S.png" alt=""></a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<a href="#" class="client__item"><img src="/img/clients/Comme Des Garcons.png" alt=""></a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<a href="#" class="client__item"><img src="/img/clients/client-6.png" alt=""></a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<a href="#" class="client__item"><img src="/img/clients/client-7.png" alt=""></a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<a href="#" class="client__item"><img src="/img/clients/client-8.png" alt=""></a>
				</div>
			</div>
		</div>
	</section>
	<!-- Team Section End -->

	<!-- Client Section Begin -->
	<section class="team spad" style="padding-top: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<!--
						<span>Our Team</span>
						  -->
						<h2>Team</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="team__item">
						<img src="#" alt="">
						<h4>오서희</h4>
						<span>Team Leader</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="team__item">
						<img src="#" alt="">
						<h4>박혜진</h4>
						<span>Team SubLeader</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="team__item">
						<img src="#" alt="">
						<h4>권용신</h4>
						<span>Team Member(Clerk)</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="team__item">
						<img src="#" alt="">
						<h4>박재권</h4>
						<span>Team Member</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Client Section End -->

	<!-- Footer Section Begin -->
	<!--<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="#"><img src="/img/footer-logo.png" alt=""></a>
						</div>
						<p>The customer is at the heart of our unique business model, which includes design.</p>
						<a href="#"><img src="/img/payment.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Shopping</h6>
						<ul>
							<li><a href="#">Clothing Store</a></li>
							<li><a href="#">Trending Shoes</a></li>
							<li><a href="#">Accessories</a></li>
							<li><a href="#">Sale</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-6">
					<div class="footer__widget">
						<h6>Shopping</h6>
						<ul>
							<li><a href="#">Contact Us</a></li>
							<li><a href="#">Payment Methods</a></li>
							<li><a href="#">Delivary</a></li>
							<li><a href="#">Return & Exchanges</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
					<div class="footer__widget">
						<h6>NewLetter</h6>
						<div class="footer__newslatter">
							<p>Be the first to know about new arrivals, look books, sales & promos!</p>
							<form action="#">
								<input type="text" placeholder="Your email">
								<button type="submit"><span class="icon_mail_alt"></span></button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="footer__copyright__text">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<!--<p>Copyright Â©
							<script>
								document.write(new Date().getFullYear());
							</script>2020
							All rights reserved | This template is made with <i class="fa fa-heart-o"
							aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						</p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					<!--</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search Begin -->
	<!--<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->

	<!-- Js Plugins -->
	<!--<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>-->
	<%@ include file="/include/common/footer.jsp" %>
	
</body>

</html>