<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
	</script>
	<body>

			 
<div>
	<%@include file="../layout/top.jsp"%>
</div>

<h1 class="text-center"><span class="badge badge-secondary">게시글 작성</span></h1>

			

				<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
				<input type="hidden" id="writer" name="writer" value="${member.userId}"/>
					<table class="container col-lg-7">
						<tbody>
							<c:if test="${member.userId != null}">
								<tr><td>
								<input type="text" name="title" id="title" class="chk form-control text-center"
									placeholder="제목을 입력해주세요." title="제목을 입력하세요" required>
								</td></tr>
								<tr><td>
									<textarea class="chk form-control text-center" id="content" name="content" rows="5" name="bdContent"
										placeholder="내용을 입력해주세요" required title="내용을 입력하세요"
									></textarea>
								</td></tr>
								
								<tr class="form-control text-center" align="center">
									<td id="fileIndex">
										<button class="fileAdd_btn btn btn-info" type="button">파일추가</button>	
									</td>
								</tr>
								<tr>
									<td>						
										<button class="write_btn btn-priamry" type="submit">작성</button>	
										<input class="cancel_btn btn-success" type="button" value="취소" onclick="window.history.back()"/>
									</td>
								</tr>	
							</c:if>
							
						</tbody>			
					</table>
				</form>
				

<div>
	<%@include file="../layout/bottom.jsp"%>
</div>
	</body>
</html>