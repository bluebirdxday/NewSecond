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

				<section class="mainPage--carousel" style="color:black; ">
					<div id="carouselExampleIndicators" class="carousel slide mainPage--carousel__container" data-bs-ride="true">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="https://dummyimage.com/900x280/000/fff" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="https://dummyimage.com/900x280/000/fff" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="https://dummyimage.com/900x280/000/fff" class="d-block w-100" alt="...">
							</div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</section>	
				
				<section class="mainPage--goodsContainer1 mt-5">

					<span class="mainPage--category__title">최근 업데이트된 상품</span>
					<div class="row row-cols-5">
						<c:forEach items="${recentGoodsList5}" var="recentGood" begin="0" end="4">
							<div class="col">
								<a class="mainPage--item" href="/goods/${recentGood.goodsNo}">
									<img class="border border-4 rounded-3" 
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
					<button type="button" class="btn btn-outline-secondary w-100 mt-3"> 전체보기 </button>
				</section>

				<c:if test="${not empty loginUser}" >
					<section class="mainPage--goodsContainer2 mt-5">

						<span class="mainPage--category__title">최근 본 상품</span>

						<div class="row row-cols-5 ">
							<div class="col ">
								<img src="https://dummyimage.com/170x170/000/fff" class="d-block w-100 rounded-4">
							</div>
							<div class="col">
								<img src="https://dummyimage.com/170x170/000/fff" class="d-block w-100 rounded-4">
							</div>
							<div class="col">
								<img src="https://dummyimage.com/170x170/000/fff" class="d-block w-100 rounded-4">
							</div>
							<div class="col">
								<img src="https://dummyimage.com/170x170/000/fff" class="d-block w-100 rounded-4">
							</div>
							<div class="col">
								<img src="https://dummyimage.com/170x170/000/fff" class="d-block w-100 rounded-4">
							</div>
						</div>
						<button type="button" class="btn btn-outline-secondary w-100 mt-3"> 전체보기 </button>
					</section>
				</c:if>

				<section class="mainPage--goodsContainer3 mt-5">

					<span class="mainPage--category__title">조회수 높은 인기 상품</span>

					<div class="row row-cols-5">
						<c:forEach items="${mostViewedList10}" var="mostViewed" begin="0" end="4">
							<div class="col">
								<a class="mainPage--item" href="/goods/${mostViewed.goodsNo}">
									<img class="border border-4 rounded-3" 
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

					<div class="row row-cols-5 mt-4">
						<c:forEach items="${mostViewedList10}" var="mostViewed" begin="5" end="9">
							<div class="col">
								<a class="mainPage--item" href="/goods/${mostViewed.goodsNo}">
									<img class="border border-4 rounded-3" 
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
					<button type="button" class="btn btn-outline-secondary w-100 mt-3"> 전체보기 </button>
				</section>

		</div>

	</main>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	

</body>	
</html>

