<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- JQuery 추가 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>SpringMVC</title>
</head>
<body>
<div>
	<%@include file="../layout/top.jsp"%>
</div>

	<div class="container col-lg-4">
		<h2 class="text-center">로그인</h2>
		<form name='homeForm' method="post" action="/member/login">
			<div class="form-group">
				<label for="userID">아이디</label>
				<input type="text" class="form-control" 
					placeholder="아이디를 입력하세요" id="userId" name="userId">
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label>
				<input type="password" class="form-control" 
					placeholder="비밀번호를 입력하세요" id="userPass" name="userPass">
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>

<div>
	<%@include file="../layout/bottom.jsp"%>
</div>
</body>
</html>