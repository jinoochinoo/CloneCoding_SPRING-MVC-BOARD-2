<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>SpringMVC</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dataType : "json",
					data : $("#updateForm").serializeArray(),
					success : function(data){
						if(data == true){
							if(confirm("회원정보를 수정하시겠습니까?")){
								$("#updateForm").submit();
							}
						} else{
							alert("패스워드가 틀렸습니다.");
							return;
						}
					}
				})
			});
		})
	</script>
	<body>
<div>
	<%@include file="../layout/top.jsp"%>
</div>	
<div class="container text-center">
	<h2>회원정보 수정</h2>
		<div class="container col-lg-6">
			<form id="updateForm" action="/member/memberUpdate" method="post">
				<div class="input-group mt-3 mb-1">
					<div class="input-group-prpend">
						<span class="input-group-text">아이디</span>
					</div>
						<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
				</div>
				<div class="input-group mt-3 mb-1">
					<div class="input-group-prpend">
						<span class="input-group-text">비밀번호</span>
					</div>
						<input class="form-control" type="password" id="userPass" name="userPass" />
				</div>
				<div class="input-group mt-3 mb-1">
					<div class="input-group-prpend">
						<span class="input-group-text">이름</span>
					</div>
						<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}"/>
				</div>
			</form>	
				<div class="form-group has-feedback">
					<button class="btn btn-primary" type="button" id="submit">회원정보수정</button>
					<a class="btn btn-success" href="/member/memberDeleteView">회원 탈퇴</a>
					<button class="cancel btn btn-danger" type="button">취소</button>
				</div>
		</div>
</div>
<div>
	<%@include file="../layout/bottom.jsp"%>
</div>		
	</body>
	
</html>