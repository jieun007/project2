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
<form id="writeForm" action="/board/write" method="post">
    <div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
            <p>게시판 입니다. - 글 작성</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" name="title"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${user.userID}</dd>
                        
                    </dl>
                    <dl>
                        <dt></dt>
                        <dd><input type="hidden"  name="id" value="${user.userID}">
                        <input type="hidden"  name="pw" value="${user.userPassword}"></dd>
                    </dl>
                        <dt>비밀번호</dt>
                        <dd><input type="password" placeholder="비밀번호 입력" name="pw"></dd>
                    </dl>
                </div>
                
                <div class="cont">
                    <textarea placeholder="내용 입력" name="content"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
            	<a href=# id="write_btn">등록</a>
            	<a href=# id="cancel_btn" class="on">취소</a>
            </div>
        </div>
    </div>
    </form>
    <form id="infoForm" action="/board/write" method="get">
          <input type="hidden" name="boardNum" value="<c:out value="${boardNum.num}"/>">
    </form>
<script>
let form = $("#infoForm");
let wForm = $("#writeForm");

$("#write_btn").on("click", function(e){
	wForm.submit();
});
$("#cancel_btn").on("click", function(e){
    form.attr("action", "/board/list");
    form.submit();
});
</script>
</body>
</html>