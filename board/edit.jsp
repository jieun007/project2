<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
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
<form id="editForm" action="/board/edit" method="post">
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항</strong>
            <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="hidden" name="num" value="<c:out value="${boardNum.num}"/>">
                        <input type="hidden" name="postdate" value="<c:out value="${boardNum.postdate}"/>">
                        <input type="text" name="title" value="<c:out value="${boardNum.title}"/>"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                           <dd>
                              <div>${user.userID}</div>
                           </dd>
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd><input type="hidden"  name="id" value="${user.userID}">
                        <input type="hidden"  name="pw" value="${user.userPassword}"></dd>
                    </dl>
                </div>
                
                <div class="cont">
                    <textarea placeholder="내용 입력" name="content"><c:out value="${boardNum.content}"/></textarea>
                </div>
            </div>
            <div class="bt_wrap">
            	<a href=# id="edit_btn" class="on">수정</a>
            	<a href=# id="delete_btn">삭제</a>
                <a href=# id="cancel_btn" class="on">취소</a>
            </div>
            
        </div>
    </div>
    </form>
    <form id="infoForm" action="/board/edit" method="get">
          <input type="hidden" name="boardNum" value="<c:out value="${boardNum.num}"/>">
    </form>
<script>

let form = $("#infoForm");
let mForm = $("#editForm");

$("#cancel_btn").on("click", function(e){
    form.find("#num").remove();
    form.attr("action", "/board/list");
    form.submit();
});

$("#edit_btn").on("click", function(e){
	mForm.submit();
});

$("#delete_btn").on("click", function(e){
	form.attr("action","/board/delete");
	form.attr("method","post");
	form.submit();
});
</script>
</body>
</html>
