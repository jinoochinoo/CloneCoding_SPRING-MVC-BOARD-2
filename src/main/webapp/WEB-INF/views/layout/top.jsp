<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
  <title>SpringMVC</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>My First Bulletin Board with MVC Pattern</h1>
		<h5>Thanks to visit and share your precious time!</h5>
	</div>


	<nav
		class="navbar navbar-expand-sm bg-dark navbar-dark 
navbar navbar-expand-sm bg-light justify-content-center"
	>
		<!-- Brand/logo -->
		<a class="navbar-brand" href=".user"> <img src="https://avatars2.githubusercontent.com/u/73393147?s=460&u=a8db6559fd9b52d0dfc7bfd220431e305502873e&v=4"
			alt="logo" style="width: 40px;">
		</a>
		
	<c:if test="${member != null}">
		<!-- 로그인 후 Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/board/list">일반 게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Ajax 게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="/member/memberUpdateView">회원정보 수정</a></li>
			<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
		</ul>
	</c:if>

	<c:if test="${member == null}">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/board/list">일반 게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Ajax 게시판</a></li>
			<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="/member/register">회원가입</a></li>
		</ul>
	</c:if>

	</nav>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>