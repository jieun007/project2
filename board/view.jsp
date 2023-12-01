<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<%
    // index 값을 가져옴
    int index = Integer.parseInt(request.getParameter("index"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelector('.board_title').classList.add('loaded');
    });
</script>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
    <div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
            <p>게시판 입니다. - 글 보기</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
            
                <div class="title"><c:out value="${boardWrite.title}"></c:out></div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>
                        <c:out value="${param.index}"></c:out>
                        <input type="hidden" name="boardNum" value="${boardWrite.num}"/>
                        </dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><c:out value="${boardWrite.id}"></c:out></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><c:out value="${boardWrite.postdate}"></c:out></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd><c:out value="${boardWrite.visitcount}"></c:out></dd>
                    </dl>
                    <dl>
<!--                         <dt>좋아요 </dt> -->
                        
                    </dl>
                </div>
                <div class="cont"><c:out value="${boardWrite.content}"></c:out></div>
 
            </div>
            <div class="bt_wrap">
                <a href="list" class="on">목록</a>
                <a href='<c:url value="edit"><c:param name="boardNum" value="${boardWrite.num}" /></c:url>'>
                    	수정
    				</a>
    			
            </div>
           <div class="comment_wrap">
    		<form id="commentForm" action="/board/view" method="post">
    		<!-- 게시글 ID와 댓글의 boardId가 일치하는 경우에만 표시 -->
	        	
	        		<div>
                    <div >작성자 <c:out value="${user.userID}" ></c:out></div>
                    <!-- 게시판 넘버와 로그인한 아이디 받아옴 -->
                    <input type="hidden" name="board_num" value="${boardWrite.num}">
                    <input type="hidden" name="index" value="${param.index}" />
                    <input type="hidden" name="id" value="${user.userID}"  />
                    <!-- 댓글 내용 입력 -->
                    <input type="text" name="co_content" placeholder="댓글을 입력하세요" />
                    
                  <button type="button" class="comment_btn">입력</button>
                  
                          
                 </div>
        		</form>
        		<div class="comment_list">
        		
        		<c:forEach items="${comments}" var="comments">
        		<div class="comment" data-comments-num="${comments.co_num}">
        		
        			<div class="co_num" style="display: none" ><c:out value="${comments.co_num}"></c:out>
        			</div>
        			<div class="cd">
        			<c:out value="${comments.id}"  />
        			</div>
        			<div class="co_content">
        			<c:out value="${comments.co_content}"></c:out>
        			</div>
        			<div class="co_date">
        			<c:out value="${comments.co_date}"></c:out>
        			<!-- 수정 버튼 -->
			        <button type="button" class="edit-comment-btn" >수정</button>
			        
			        <!-- 삭제 버튼 -->
			        <button type="button" class="delete-comment-btn" >삭제</button>
        			</div>
        		</div>
        		
        		</c:forEach>
        		</div>
        		
    		
			</div>
			
        </div>
    </div>
    
<script>
$(document).ready(function() {
	$(document).on("click", ".comment_btn", function(e) {
        /* e.preventDefault(); */

        var formData = {
            index: $("input[name='index']").val(),
            co_content: $("input[name='co_content']").val(),
            id: $("input[name='id']").val(),
            board_num: $("input[name='board_num']").val()
        };

        $.ajax({
            type: "POST",
            url: "/board/view",
            data: JSON.stringify(formData),
            contentType: "application/json",
            success: function(data) {
                if (data && data.length > 0) {
                    // 새로운 댓글 리스트를 동적으로 갱신
                    console.log(data)
                    $(".comment_list").empty();
                    for (var i = 0; i < data.length; i++) {
                        var commentHtml = '<div class="comment">' +
                        	'<div style="display: none">' + data[i].co_num + '</div>'+
                            '<div class="id">' + data[i].id + '</div>' +
                            '<div class="co_content">' + data[i].co_content + '</div>' +
                            '<div class="co_date">' + data[i].co_date  +
                    
                            '<button type="button" class="edit-comment-btn" >수정</button>' +
                            '<button type="button" class="delete-comment-btn" >삭제</button>' +
                            '</div>'+
                            '</div>';
                        $(".comment_list").append(commentHtml);
                    }
					console.log($(".comment_list"));
                    // 입력 필드 초기화
                    $("input[name='co_content']").val("");
                    alert("댓글이 성공적으로 등록되었습니다.");
                    console.log("댓글이 성공적으로 등록되었습니다.");
                } else {
                    alert("댓글 등록에 실패했습니다.");
                }
            },
            error: function(error) {
                alert("댓글 등록에 실패했습니다. Error: " + error);
                console.log("Error:", error);
            }
        });
    });
    $(document).on("click", ".edit-comment-btn", function() {
        var coNum = $(this).closest(".comment").find(".co_num").text();
        var coContent = $(this).closest(".comment").find(".co_content").text();
        console.log(coContent)

        // 사용자에게 새로운 코멘트 내용을 입력받습니다.
        var newCoContent = prompt("댓글을 수정하세요:", coContent);

        // 사용자가 내용을 입력했을 경우에만 코멘트를 업데이트합니다.
        if (newCoContent !== null) {
            var formData = {
                co_num: coNum,
                co_content: newCoContent,
                board_num: $("input[name='board_num']").val()
            };

            $.ajax({
                type: "POST",
                url: "/board/comment/update",
                data: JSON.stringify(formData),
                contentType: "application/json",
                success: function(data) {
                	console.log("updatedComments",data)
                    // 업데이트된 코멘트 리스트로 화면을 갱신합니다.
                    $(".comment_list").empty();
                    for (var i = 0; i < data.length; i++) {
                        var commentHtml = '<div class="comment">' +
                            '<div style="display: none;">' + data[i].co_num + '</div>' +
                            '<div class="id">' + data[i].id + '</div>' +
                            '<div class="co_content">' + data[i].co_content + '</div>' +
                            '<div class="co_date">' + data[i].co_date  +
          
                            '<button type="button" class="edit-comment-btn">수정</button>' +
                            '<button type="button" class="delete-comment-btn">삭제</button>' +
                            '</div>'+
                            '</div>';
                        $(".comment_list").append(commentHtml);

                    }
                    console.log("나와라",$(".comment_list"))
                    alert("댓글이 성공적으로 수정되었습니다.");
                    console.log("댓글이 성공적으로 수정되었습니다.")
                },
                error: function(error) {
                    alert("댓글 수정에 실패했습니다. Error: " + error);
                    console.log("Error:", error);
                }
            });
        }
    });

 // 삭제 버튼에 대한 이벤트 리스너
    $(document).on("click", ".delete-comment-btn", function() {
        var coNum = $(this).closest(".comment").find(".co_num").text();

        // 삭제 여부를 확인하는 confirm 창을 띄웁니다.
        var confirmDelete = confirm("정말로 이 댓글을 삭제하시겠습니까?");

        // 사용자가 확인을 눌렀을 경우에만 코멘트를 삭제합니다.
        if (confirmDelete) {
            var formData = {
                co_num: coNum
            };

            var deletedCommentElement = $(this).closest(".comment");

            $.ajax({
                type: "POST",
                url: "/board/comment/delete",
                data: JSON.stringify(formData),
                contentType: "application/json",
                success: function() {
                    // 삭제된 코멘트만 화면에서 제거합니다.
                    deletedCommentElement.remove();
                    alert("댓글이 성공적으로 삭제되었습니다.");
                },
                error: function(error) {
                    alert("코멘트 삭제에 실패했습니다. Error: " + error);
                    console.log("Error:", error);
                }
            });
        }
    });
});
</script>

</body>
</html>