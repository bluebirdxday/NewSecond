<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>New Second</title>

	<link rel="stylesheet" href="/resources/src/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/resources/src/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" href="/resources/css/mainPage.css">

</head>
<body>

	<jsp:include page="/WEB-INF/views/user/login.jsp"/>
	
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
			
			${loginUser}

			<section class="mainPage--goodsContainer1 mt-5">
				<h4>최근 업데이트된 상품</h4>
				<div class="row">
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
			<section class="mainPage--goodsContainer2 mt-5">
				<h4>최근 본 상품</h4>
				<div class="row">
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

			<section class="mainPage--goodsContainer3 mt-5">
				<h4>조회수 높은 인기 상품</h4>

				<div class="row">
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

				<div class="row mt-4">
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

		</div>

	</main>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="/resources/src/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
