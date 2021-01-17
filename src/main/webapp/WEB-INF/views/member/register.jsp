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
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
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
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/member/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					} else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용 가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	<body>
<div>
	<%@include file="../layout/top.jsp"%>
</div>
<div class="container text-center">
	<h2>회원가입</h2>
		<div class="container col-lg-6">
			<form action="/member/register" method="post">
				<div class="input-group mt-3 mb-1">
					<div class="input-group-prpend">
						<span class="input-group-text">아이디</span>
					</div>
						<input type="text" name="userId" class="form-control"
							placeholder="아이디를 입력하세요"  name="userId"/>
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div class="input-group mt-3 mb-1">
					<div class="input-group-prpend">
						<span class="input-group-text">비밀번호</span>
					</div>
						<input class="form-control" type="password" id="userPass" name="userPass" 
							placeholder="비밀번호를 입력하세요"/>
				</div>
				<div class="input-group mt-3 mb-1">
					<div class="input-group-prpend">
						<span class="input-group-text">이름</span>
					</div>
						<input class="form-control" type="text" id="userName" name="userName" 
							placeholder="이름을 입력하세요"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</div>
</div>
<div>
	<%@include file="../layout/bottom.jsp"%>
</div>
	</body>
	
</html>
		