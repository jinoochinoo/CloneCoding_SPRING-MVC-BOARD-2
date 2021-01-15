<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- JQuery 추가 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
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
		
		$(".replyWriteBtn").on("click", function(){
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/board/replyWrite");
			formObj.submit();
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

</script>
<body>

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />

		<section id="container">
			<!-- 수정, 삭제 버튼 클릭하면 hidden type 방식으로 bno 값 넘겨주기 위한 form -->
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" readonly="readonly"/>
			<!-- 목록 클릭하면 검색했던 값 그대로 돌려주기 위해 저장 -->	
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			</form>
				<table>
					<tbody>
						<tr>
							<td>
								<label for="bno">글 번호</label>
								<input type="text" id="bno" name="bno" value="${read.bno}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="title">제목</label>
								<input type="text" id="title" name="title" value="${read.title}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="content">내용</label>
								<textarea id="content" name="content" readonly="readonly"><c:out
										value="${read.content}"
									/></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label>
								<input type="text" id="writer" name="writer"
									value="${read.writer}" readonly="readonly"
								/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</tbody>
				</table>
		</section>
		<div>
			<button type="submit" class="update_btn">수정</button>
			<button type="submit" class="delete_btn">삭제</button>
			<button type="submit" class="list_btn">목록</button>
		</div>
		
		<!-- 댓글 -->
		
		<div id="reply">
		  <ol class="replyList">
		    <c:forEach items="${replyList}" var="replyList">
		      <li>
		        <p>
		        작성자 : ${replyList.writer}<br />
		        작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
		        </p>
		
		        <p>${replyList.content}</p>
		        <div>
				  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
				  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
				</div>
		      </li>
		    </c:forEach>   
		  </ol>
		</div>
		
		<form name="replyForm" method="post">
			  <input type="hidden" id="bno" name="bno" value="${read.bno}" />
			  <input type="hidden" id="page" name="page" value="${scri.page}"> 
			  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			
			  <div>
			    <label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" />
			    <br/>
			    <label for="content">댓글 내용</label><input type="text" id="content" name="content" />
			  </div>
			  <div>
			 	 <button type="button" class="replyWriteBtn">작성</button>
			  </div>
		</form>
		
		<hr />
	</div>
</body>
</html>