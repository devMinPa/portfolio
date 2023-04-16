<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.Product"%>

<script>
	$('#myTab a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
	})
	$('.dropdown-toggle').dropdown()
</script>

<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>


		</div>
		<ul class="nav nav-tabs">
			<li class="nav-item dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">Category</button>
				<div class="dropdown-menu">
					<button class="dropdown-item" type="button">Books</button>
					<button class="dropdown-item" type="button">Clothes</button>
					<button class="dropdown-item" type="button">IT</button>
					<button class="dropdown-item" type="button">Home Appliances</button>
					<button class="dropdown-item" type="button">Kitchen Equipments</button>
					<button class="dropdown-item" type="button">Sports</button>
					<button class="dropdown-item" type="button">Contents</button>
				</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">Sub_Ctg</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">sportsBook</a>
					<a class="dropdown-item" href="#">examinationBook</a>
					<a class="dropdown-item" href="#">historyBook</a>
					<a class="dropdown-item" href="#">electricBook</a>
				</div>
			</li>
		</ul>
	</div>

	<div class="container">
		<div class="row" align="center">
			<%
			ProductRepository dao=ProductRepository.getInstance();
			ArrayList<Product> listOfProducts = dao.getAllProducts();
	 		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i); 
			%>
			<div class="col-md-4">
				<img src ="./upload2/<%=product.getFilename()%>" style ="width: 100%">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
				<p><a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>
		
			<%
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
