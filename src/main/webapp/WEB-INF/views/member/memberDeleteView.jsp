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
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				$.ajax({
					url : "/member/passChk",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("정말로 탈퇴하시겠습니까?")){
								$("#delForm").submit();
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
	<h2>회원 탈퇴</h2>
		<div class="container col-lg-6">
			<form action="/member/memberDelete" method="post" id="delForm">
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
						<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}" readonly="readonly"/>
				</div>
			</form>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="submit">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</div>
</div>
<div>
	<%@include file="../layout/bottom.jsp"%>
</div>
	</body>
	
</html>