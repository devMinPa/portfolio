<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> <!-- integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous" -->
<script>window.jQuery || document.write('<script src="./resources/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="./resources/vendor/popper.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script type="text/javascript">

	var ajax1; // XMLhttpRequest객체를 저장할 변수, 전역변수선언
	
	function createAJAX()
	{
		ajax1 = new XMLHttpRequest();
	}
	
	function getData()//json 요청
	{		
		var div_name = "majorCtgList";
// 		var ctg_id = document.forms[form_name].elements["txt_user_id"].value;
		
		createAJAX(); // createXHR() 메소드 호출
		
		var url = "./ctgInfo.jsp"; //요청 url 설정
		var reqparam = "s_ctg_id=1";
		
		ajax1.onreadystatechange = resGetData; // 다되면 실행할 함수 등록(호출 아님. 역호출)
		ajax1.open("Post", url, "true"); //서버의 요청설정 -url변수에 설정된 리소스를 요청할 준비
		ajax1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		ajax1.send(reqparam);
	}

	function resGetData()
	{
		if(ajax1.readyState == 4)
		{
			if(ajax1.status == 200)
			{
				//alert("2");
				
				var result = ajax1.responseText;
 				alert(result);
				
 				var objRes = eval("("+result+")");
 				alert(objRes);
				
				var num = objRes.datas.length;
				var res = "<div class='dropdown-menu show' x-placement='bottom-start' style='position: absolute; transform: translate3d(0px, 38px, 0px); top: 0px; left: 0px; will-change: transform;'>";
				var resDiv = document.getElementById("majorCtgList");
				
				if(num<1)
				{
					res += "</div>";
				}
				else
				{
					for(var i=0; i<num; i++)
					{
						var majorCtgId = objRes.datas[i].majorCtgId;
						var majorCtgName = objRes.datas[i].majorCtgName;
						
						res +="<button class='dropdown-item' type='button'";
						res +=" value='"+majorCtgId+"' onclick='select_Major("+majorCtgId+")'>";
						res += majorCtgName+"</button>";
					}
				}
				
				alert(res);
				resDiv.innerHTML = res;
				
				
			}
		}
	}
	function searchData()
	{
	
		//alert("111")
		var form_name = "form_main";
		var user_id = document.forms[form_name].elements["txt_user_id"].value;
		//alert("123");
// 		if(user_id == "")
// 		{			
			
// 			document.forms[form_name].elements["txt_user_id"].focus();
// 			return;
// 		}
// 		else
// 		{
			//alert("user_id ");
			getData();
// 		}		
	}
	
</script>


</head>
<body onload="getData()">
<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>


		</div>
		<ul class="nav nav-tabs">
			<li class="nav-item dropdown">
				<button id="majorCtg" class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">Books</button>
				<div id="majorCtgList" class="dropdown-menu">
<!-- 					<button class="dropdown-item" type="button" value="Books" onclick="select_Major(this.value)">Books</button> -->
<!-- 					<button class="dropdown-item" type="button">Clothes</button> -->
<!-- 					<button class="dropdown-item" type="button">IT</button> -->
<!-- 					<button class="dropdown-item" type="button">Home Appliances</button> -->
<!-- 					<button class="dropdown-item" type="button">Kitchen Equipments</button> -->
<!-- 					<button class="dropdown-item" type="button">Sports</button> -->
<!-- 					<button class="dropdown-item" type="button">Contents</button> -->
				</div>
			</li>
		</ul>
	</div>
			
<form name="form_main" onSubmit="javascript:return false;">
	<div class="container">
	    <div class="row">
	        <div class="col-xs-12"> -</div>
	    </div>
	    <div class="row">
	        <div class="col-sm-6 col-md-3"></div>
	        <div class="col-sm-6">   
	        	<div class="input-group mb-3">
		      		<input type="text" name='txt_user_id' class="form-control" placeholder="ID 입력바람!" aria-label="Recipient's username" aria-describedby="button-addon2" onkeyup='javascript:searchData();'>
		      		<button class="btn btn-primary" type="button" id="button-addon2" onClick='javascript:searchData();' >Button</button>
		    	</div>
		    	<div id='div_res' class="input-group mb-3" >
		    	
		    	</div>
    		</div>
	        <div class="col-md-3"></div>
	    </div>
	    <div class="row">
	        <div class="col-xs-12"></div>
	    </div>
	</div>
 </form>
 
 	
   
</body>
</html>