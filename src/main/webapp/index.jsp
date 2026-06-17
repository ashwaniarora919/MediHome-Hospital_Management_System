<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<style type="text/css">
.card-body {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="Component/allcss.jsp"%>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="Images/doc1.jpg" class="d-block w-100" alt="Loading..."
					height="400px">
			</div>
			<div class="carousel-item">
				<img src="Images/doc2.jpg" class="d-block w-100" alt="Loading..."
					height="400px">
			</div>
			<div class="carousel-item">
				<img src="Images/doc3.jpg" class="d-block w-100" alt="Loading..."
					height="400px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container p-3">
		<p class="text-center fs-2">Key features of our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-sm-6">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">100% Safety</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Clean Environment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6 mt-2">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Friendly Doctors</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 mt-2">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Medical Research</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<img alt="" src="Images/doctor1.png" height="300px">
			</div>
		</div>
	</div>

	<hr>

	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>

		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="image"
							src="https://static.vecteezy.com/system/resources/thumbnails/048/740/093/small/doctor-writing-on-a-clipboard-isolated-against-a-transparent-background-png.png"
							height="200px">
						<h5 class="card-title">Dr. Ashu</h5>
						<p class="card-text">(CEO & Chairman)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="image"
							src="https://img.freepik.com/free-photo/doctor-reading-book-white-background_1368-5890.jpg?semt=ais_hybrid&w=740&q=80"
							height="200px">
						<h5 class="card-title">Dr. Ajay</h5>
						<p class="card-text">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="image"
							src="https://www.shutterstock.com/image-photo/medical-professional-portrait-happy-female-600nw-2333089545.jpg"
							height="200px">
						<h5 class="card-title">Dr. Aarti</h5>
						<p class="card-text">(Chief Doctor)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="image"
							src="https://t3.ftcdn.net/jpg/15/51/68/02/360_F_1551680228_2jVHckmqzSf9I5HFLSb8lAky2NdrX25X.jpg"
							height="200px">
						<h5 class="card-title">Dr. Pari</h5>
						<p class="card-text">(Chief Doctor)</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="Component/footer.jsp"%>
</body>
</html>