<%@page import="java.io.PrintWriter"%><%@page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpringMVC</title>

	<script type="text/javascript">
	function writeForm() {
		location.href = "/board/writeView";
	}
	</script>
</head>
<body>

<div>
	<%@include file="../layout/top.jsp"%>
</div>

	<div class="container">
		<h2 class="text-center">게시판</h2>

		<div class="search" align="right">
    				<select name="searchType">
					      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
   					 </select>

				<input type="text" class="btn btn-outline-light text-dark col-sm-3"
					placeholder="Search" name="keyword" id="keywordInput" value="${scri.keyword}">
				<button class="btn btn-success btn-sm" type="button" id="searchBtn">Go</button>

			          <script>
					      $(function(){
					        $('#searchBtn').click(function() {
					          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
					    
		</div>
		<table class="table">
			<thead class="table-primary text-center">
				<tr>
					<th style="width: 10%">번호</th>
					<th style="width: 50%">제목</th>
					<th style="width: 15%">글쓴이</th>
					<th style="width: 15%">작성일</th>
					<th style="width: 10%">조회수</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>
								<c:out value="${list.bno}" />
							</td>
							<td>
								<a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
								<c:out	value="${list.title}"/></a>
							</td>
							<td>
								<c:out value="${list.writer}" />
							</td>
							<td>
								<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" />
							</td>
							<td>
								<c:out value="${list.hit}"/>
							</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	<br />

	<c:if test="${sessionScope.member!=null}">
		<div id="topForm" class="text-center">
			<input type="button" class="btn btn-primary" value="글쓰기"
				onclick="writeForm()"
			>
		</div>
	</c:if>

	<br />
	<div id="pageForm" class="container">
		<ul class="pagination justify-content-center">

			<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}"
							>이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link"
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}"
							>다음</a></li>
						</c:if>

		</ul>
	</div>

<div>
	<%@include file="../layout/bottom.jsp"%>
</div>
</body>
</html>