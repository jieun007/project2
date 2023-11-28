<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
  $(document).ready(function () {
    $("#loginBtn").click(function (e) {
    	var str = $(this).attr("href") 
    	var result_str =  "/main?userID="+ $('[name=userID]').val() +"&userPassword="+ $('[name=userPassword]').val()
    	console.log(result_str)
    	$(this).attr("href", result_str)
    
    });

  });
</script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인 화면</title>
    <link href="/resources/css/login.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <% request.setCharacterEncoding("UTF-8"); %>
    <div class="login-box">
      <h2>로그인</h2>
      <form method="post" action="login">
        <div class="user-box">
          <input type="text" name="userID" required="" />
          <label>아이디</label>
        </div>
        <div class="user-box">
          <input type="password" name="userPassword" required="" />
          <label>비밀번호</label>
        </div>
        
        <a href="" class="btn-login" id="loginBtn">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          로그인
        </a>
        <a href="join" style="margin-left: 45px">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          회원가입
        </a>
        <a href="find_ID" id="searchBtn">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          아이디/비밀번호 찾기
        </a>
        
      </form>
    </div>
  </body>
</html>
