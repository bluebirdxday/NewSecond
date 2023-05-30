<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>New Second</title>

	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

	<link rel="stylesheet" href="/resources/css/mainPage.css">


</head>
<body>

	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>


			<div class="mainPage--wholeWrapper">

				<%-- https://getbootstrap.kr/docs/5.2/components/carousel/ --%>

				<section class="mainPage--carousel">
					<div id="carouselIndicators" class="carousel slide mainPage--carousel__container" data-bs-ride="carousel" data-bs-interval="10000">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>

						<div class="carousel-inner">
							<div class="carousel-item active mainPage--carousel__item">
								<img src="/resources/src/img/mainCarousel/carousel-1.png" class="d-block w-100" >
								<div class="carousel-caption d-none d-md-block">
									<p>뉴세컨드의 바다에 오신걸 환영합니다!</p>
								</div>
							</div>
							<div class="carousel-item mainPage--carousel__item ">
								<img src="/resources/src/img/mainCarousel/carousel-4.png" class="d-block w-100" style="transform: translateY(-100px)">
								<div class="carousel-caption d-none d-md-block">
									<p>당신의 물건들을 진열장에 걸어두세요!</p>
								</div>
							</div>
							<div class="carousel-item mainPage--carousel__item">
								<img src="/resources/src/img/mainCarousel/carousel-9.png" class="d-block w-100" style="transform: translateY(-100px)"" >
								<div class="carousel-caption d-none d-md-block">
									<p>뉴세컨드와 함께! 당신의 여름을 상상해보세요!</p>
								</div>
							</div>
						</div>

					</div>
				</section>	
				
				<section class="mainPage--goodsContainer1 mt-5">

					<span class="mainPage--imgs__title">최근 업데이트된 상품</span>
					
										<%-- main.homeController를 통해서 recentGoodsList를 불러옴 --%>
										<%-- recentGoodsList를 불러와서 상품을 나열 --%>
					<div class="row row-cols-5">
						<c:forEach items="${recentGoodsList10}" var="recentGood" begin="0" end="4">
							<div class="col mainPage--item__container">
								<a href="/goods/${recentGood.goodsNo}">
									<img class="border border-1 rounded-3 mainPage--item" 
									src="${recentGood.thumbnail}" 
									onerror="this.src='/resources/src/img/no_image.jpeg'"
									data-bs-toggle="tooltip" 
									data-bs-placement="top" 
									data-bs-title="${recentGood.goodsTitle}"
									>
									<%-- https://getbootstrap.kr/docs/5.2/components/tooltips/ --%>
								</a>
							</div>
						</c:forEach>
					</div>

					<div class="row row-cols-5 mt-3">
						<c:forEach items="${recentGoodsList10}" var="recentGood" begin="5" end="9">
							<div class="col mainPage--item__container">
								<a href="/goods/${recentGood.goodsNo}">
									<img class="border border-1 rounded-3 mainPage--item" 
									src="${recentGood.thumbnail}" 
									onerror="this.src='/resources/src/img/no_image.jpeg'"
									data-bs-toggle="tooltip" 
									data-bs-placement="top" 
									data-bs-title="${recentGood.goodsTitle}"
									>
								</a>
							</div>
						</c:forEach>
					</div>

					<a class="btn btn-outline-secondary w-100 mt-2" href="/goods/category/100"> 전체보기 </a>


				</section>

				

				<section class="mainPage--goodsContainer3 mt-5 mb-5">

					<span class="mainPage--imgs__title">조회수 높은 인기 상품</span>

											<%-- main.homeController를 통해서 mostViewedList를 불러옴 --%>
											<%-- mostViewedList를 불러와서 상품을 나열 --%>
					<div class="row row-cols-5">
						<c:forEach items="${mostViewedList10}" var="mostViewed" begin="0" end="4">
							<div class="col mainPage--item__container">
								<a href="/goods/${mostViewed.goodsNo}">
									<img class="border border-1 rounded-3 mainPage--item" 
									src="${mostViewed.thumbnail}" 
									onerror="this.src='/resources/src/img/no_image.jpeg'"
									data-bs-toggle="tooltip" 
									data-bs-placement="top" 
									data-bs-title="${mostViewed.goodsTitle}"
									>
								</a>
							</div>
						</c:forEach>
					</div>

					<div class="row row-cols-5 mt-3">
						<c:forEach items="${mostViewedList10}" var="mostViewed" begin="5" end="9">
							<div class="col mainPage--item__container">
								<a href="/goods/${mostViewed.goodsNo}">
									<img class="border border-1 rounded-3 mainPage--item" 
									src="${mostViewed.thumbnail}" 
									onerror="this.src='/resources/src/img/no_image.jpeg'"
									data-bs-toggle="tooltip" 
									data-bs-placement="top" 
									data-bs-title="${mostViewed.goodsTitle}"
									>
								</a>
							</div>
						</c:forEach>
					</div>
					<a class="btn btn-outline-secondary w-100 mt-2" href="/goods/category/200"> 전체보기 </a>
				</section>


			<%-- 로그인 상태면 글쓰기 버튼이 보이게끔 함. --%>
			<c:if test="${not empty loginUser}" >
				<a href="/writing/write">
					<div class="myshop--btn__fixed-addpost">
						<img src="/resources/src/img/addPost.png">
					</div>
				</a>
			</c:if>

		</div>


	




	</main>




	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	

</body>	
</html>

