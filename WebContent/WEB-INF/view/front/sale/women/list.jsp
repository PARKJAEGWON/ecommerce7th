<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page info="/front/center/board/faq/list.jsp"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<%@ include file="/include/common/header.jsp"%>
<%@ include file="/include/common/top.jsp"%>

</head>

<body>
	<header class="header">
		<section class="breadcrumb-option">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb__text">
							<h4>여성</h4>
							<div class="breadcrumb__links">
								<a href="/index.jsp">메인</a> <span>여성</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="shop spad">
			<div class="container">
				<div class="row">
					<%@ include file="/include/front/lnbSale.jsp"%>
					<div class="col-lg-9">
						<div class="shop__product__option">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="shop__product__option__left">
										<p>상품 목록</p>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="shop__product__option__right">
										<p></p>
										<select>
											<option value="">신상품순</option>
											<option value="">인기상품순</option>
											<option value="">낮은가격순</option>
											<option value="">높은가격순</option>
											<option value="">높은할인율순</option>
											<option value="">구매후기순</option>
											<option value="">MD추천순</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="/img/product/product-2.jpg">
										<ul class="product__hover">
											<li><a href="#"><img src="/img/icon/heart.png"
													alt=""></a></li>
											<li><a href="#"><img src="/img/icon/compare.png"
													alt=""> <span>비교</span></a></li>
											<li><a href="#"><img src="/img/icon/search.png"
													alt=""></a></li>
										</ul>
									</div>
									<div class="product__item__text">
										<h6>자켓</h6>
										<a href="#" class="add-cart">+ 장바구니</a>
										<div class="rating">
											<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<h5>₩25,000</h5>
										<div class="product__color__select">
											<label for="pc-4"> <input type="radio" id="pc-4">
											</label> <label class="active black" for="pc-5"> <input
												type="radio" id="pc-5">
											</label> <label class="grey" for="pc-6"> <input type="radio"
												id="pc-6">
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item sale">
									<div class="product__item__pic set-bg"
										data-setbg="/img/product/product-3.jpg">
										<span class="label">할인</span>
										<ul class="product__hover">
											<li><a href="#"><img src="/img/icon/heart.png"
													alt=""></a></li>
											<li><a href="#"><img src="/img/icon/compare.png"
													alt=""> <span>비교</span></a></li>
											<li><a href="#"><img src="/img/icon/search.png"
													alt=""></a></li>
										</ul>
									</div>
									<div class="product__item__text">
										<h6>신발</h6>
										<a href="#" class="add-cart">+ 장바구니</a>
										<div class="rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<h5>₩25,000</h5>
										<div class="product__color__select">
											<label for="pc-7"> <input type="radio" id="pc-7">
											</label> <label class="active black" for="pc-8"> <input
												type="radio" id="pc-8">
											</label> <label class="grey" for="pc-9"> <input type="radio"
												id="pc-9">
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="product__pagination">
									<a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a>
									<span>...</span> <a href="#">21</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</header>
	<%@ include file="/include/common/footer.jsp"%>
</body>
</html>