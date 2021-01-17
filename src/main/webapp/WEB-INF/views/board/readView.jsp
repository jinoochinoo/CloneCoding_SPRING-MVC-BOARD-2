<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- JQuery 추가 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>JINWOO's MVC Board</title>
<style>
</style>
<script type="text/javascript">

	$(document).ready(function(){
		
		// bno 값 저장한 form 지정
		var formObj = $("form[name='readForm']");
		
		//수정
		$(".update_btn").on("click", function(){
			formObj.attr("action", "/board/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		// 삭제
		$(".delete_btn").on("click", function(){
			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true){
				 
			formObj.attr("action", "/board/delete");
			formObj.attr("method", "post");
			formObj.submit();

			}
		});
		
		// 목록
		$(".list_btn").on("click", function(){
		
			location.href = "/board/list?page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})
		
		// 댓글 작성
		$(".replyWriteBtn").on("click", function(){
			var replyTN = confirm("댓글 다시겠습니까?");
			if(replyTN == true){
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/board/replyWrite");
			formObj.submit();
			}
		});
		
		// 댓글 수정
		$(".replyUpdateBtn").on("click", function(){
			location.href = "/board/replyUpdateView?bno=${read.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="+$(this).attr("data-rno");
		});
		
		// 댓글 삭제
		$(".replyDeleteBtn").on("click", function(){
			location.href = "/board/replyDeleteView?bno=${read.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="+$(this).attr("data-rno");
		});
	})
	
	function fn_fileDown(fileNo){
		var formObj = $("form[name='readForm']");
		$("#file_no").attr("value", fileNo);
		formObj.attr("action", "/board/fileDown");
		formObj.submit();
	}

</script>
</head>
<body>
<div>
	<%@include file="../layout/top.jsp"%>
</div>
<div>
			<!-- 수정, 삭제 버튼 클릭하면 hidden type 방식으로 bno 값 넘겨주기 위한 form -->
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}"/>
			<!-- 목록 클릭하면 검색했던 값 그대로 돌려주기 위해 저장 -->	
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				<input type="hidden" id="file_no" name="file_no" value="">


		<table class="container col-lg-9">
			<tr class="d-flex mb-3 text-center ">
				<td class="p-2 flex-fill bg-info"><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/></td>

				<td class="p-2 flex-fill bg-warning">${read.writer}</td>
				<td class="p-2 flex-fill bg-primary">${read.bno}</td>
			</tr>
			<tr>
				<td class="form-control text-center">${read.title}</td>
			</tr>
			<tr>
				<td class="form-control text-center">${read.content}</td>
			</tr>

			<tr class="form-control" align="center">
				<td class="form-group">
					<label>파일목록</label>
						<c:forEach var="file" items="${file}">
							<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
						</c:forEach>
				</td>
			</tr>
		</table>

		<div class="container col-lg-7 text-center">
			<button type="submit" class="update_btn btn-dark mb-3">수정</button>
			<button type="submit" class="delete_btn btn-warning mb-3">삭제</button>
			<button type="submit" class="list_btn btn-primary mb-3">목록</button>
		</div>
		</form>
	<br />
</div>
	<!-- 댓글 부분 -->

	<div id="reply">
		<ol class="replyList">
		<c:forEach var="replyList" items="${replyList}" >
			<div class="container col-lg-8 input-group">

				<div class="form-control">	${replyList.content}
				</div>
				<div class="input-group-prpend">
					<span class="input-group-text"  style="display: inline-block; width: 95%; text-align: center;">${replyList.writer}	 &nbsp; 	<font size="2"  color="lightgray" style="display: inline-block; width: 95%; text-align: left;">
					<fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></font></span>
				</div>

				<div class="input-group-prpend">
				<c:if test="${sessionScope.member != null}">
			        <div>
					  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
					  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
					</div>
				</c:if>

				</div>
			</div>
		</c:forEach>
		</ol>
	</div>

	<br />
	
	<form name="replyForm" method="post">
	<c:if test="${sessionScope.member != null}">

		<!-- 댓글 작성시 같이 넘겨줄 정보 -->
	  <input type="hidden" id="bno" name="bno" value="${read.bno}" />
	  <input type="hidden" id="page" name="page" value="${scri.page}"> 
	  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
	  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
	  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
	  <input type="hidden" id="writer" name="writer" value="${member.userId}">
			
		<c:if test="${sessionScope.member != null}">
			<div class="container col-lg-7 mt-2 input-group">
				<input type="text" class="form-control" placeholder="댓글"
					name="content" id="content" 
				>
				<div class="input-group-append">
					 <button class="replyWriteBtn btn-success mb-4" type="button">작성</button>
				</div>
			</div>
		</c:if>
		
	</c:if>
	
	</form>
	<br />

<div>
	<%@include file="../layout/bottom.jsp"%>
</div>
</body>
</html>