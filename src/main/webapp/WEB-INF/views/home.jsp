<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>SpringMVC</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		
		$("#registerBtn").on("click", function(){
			location.href="member/register";
		})
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
		})
	})
</script>
<body>

<div>
	<%@include file="layout/top.jsp"%>
</div>

<!-- 메인 페이지 영역 시작 -->

	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1 style="text-align: center;"><strong>JSP 게시판 소개</strong></h1>
				<p class="text-center">JSP 게시판입니다.</p>
				<p class="text-center">DB 연결은 ORACLE, JDBC 이용해서 제작했습니다.</p>
				<p class="text-center">디자인 템플릿은 부트스트랩을 사용했고, javascript·css 부분은 인터넷에서 상당 부분 참고했습니다.</p>
				<p class="text-center">게시판 구현에 필요한 로직을 이해하고 익히기에 좋은 시간이었습니다.</p>
				<p class="text-center">감사합니다.</p>

			</div>
		</div>
	</div>

	<table class="container col-lg-7">
		<tr class="text-center">
			<td>
				<a style="text-align: center;"class="btn btn-primary btn-pull text-center" href="https://github.com/jinoochinoo" role="button">깃허브 방문하기</a>
			</td>
		</tr>
	</table>

<p>${member}
</p>
<p>${member.userId}
</p>
<div>
	<%@include file="layout/bottom.jsp"%>
</div>

</body>
</html>