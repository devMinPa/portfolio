<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.Product"%>
<%! 
	
%>
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
