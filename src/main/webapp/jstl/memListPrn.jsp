<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@	taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@	taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource
	url="jdbc:mysql://localhost:3306/el_jstl_shop?useSSL=false&serverTimezone=Asia/Seoul&useUnicode=true&characterEncoding=UTF-8&allowPublicKeyRetrieval=true"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="1234" var="db"
	scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/style/style.css">
<style>
div#wrap {
	width: 600px;
	padding: 10px;
	border: 3px solid #aaa;
	border-radius: 6px;
	margin: 30px auto;
}

hr {
	margin: 20px 0px;
}

.dFlex {
	display: flex;
}

.dFlex span {
	text-align: center;
	padding: 8px 4px;
	border-bottom: 1px solid #000;
}

.dFlex>span:nth-child(1) {
	width: 60px;
}

.dFlex>span:nth-child(2) {
	width: 110px;
}

.dFlex>span:nth-child(3) {
	width: 60px;
}

.dFlex>span:nth-child(4) {
	flex: 1;
}

div.listHeader {
	font-size: 18px;
	font-weight: bold;
	background-color: rgba(0, 136, 255, 0.1);
}

div#ds>span {
	
}
</style>
</head>
<body>
	<div id="wrap">
		<h1></h1>
		<hr>
		<sql:query var="lists" dataSource="${db}">
    select num, userID, userAge, DATE_FORMAT(joinTM, '%Y-%m-%d') as joindate from memberList order by num desc
</sql:query>

		<div class="dFlex listHeader">
			<span>번호</span> <span>ID</span> <span>Age</span> <span>가입 시간</span>
		</div>

		<c:forEach var="member" items="${lists.rows}">
			<c:if test="${fn:containsIgnoreCase(member.userID, param.searchId)}">
				<div id="ds" class="dFlex">
					<span>${member.num}</span> 
					<span>${member.userID}</span> 
					<span>${member.userAge}</span>
					<span>${member.joindate}</span>
				</div>
			</c:if>
		</c:forEach>
		
		<div>
			ID 조회 <input type="text" id="searchId">
			<button type="button" id="searchBtn">검색</button>
		</div>
	</div>
	<!-- div#wrap -->
	<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>
	<script>
    let searchBtn = document.getElementById("searchBtn");
    searchBtn.addEventListener("click", function() {
        let searchId = document.getElementById("searchId").value;
        location.href = "memListPrn.jsp?searchId=" + searchId;
    });
</script>
</body>
</html>