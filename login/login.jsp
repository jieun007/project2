<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
  /* $(document).ready(function () {
    $("#loginBtn").click(function (e) {
    	var str = $(this).attr("href") 
    	var result_str =  "/main?userID="+ $('[name=userID]').val() +"&userPassword="+ $('[name=userPassword]').val()
    	
    	console.log(result_str)
    	$(this).attr("href", result_str)
    
    });

  }); */
  $(document).ready(function () {
      $("#loginBtn").click(function (e) {
          e.preventDefault(); // 기본 이벤트 방지

          var userID = $('[name=userID]').val();
          var userPassword = $('[name=userPassword]').val();
          
          
          var data={
                  userID: userID,
                  userPassword: userPassword
              }
			console.log("사랑",data )
          // Ajax를 이용하여 로그인 시도
          $.ajax({
              type: "POST",
              url: "/register/login", // 로그인 처리를 담당하는 컨트롤러 URL로 변경
              data: JSON.stringify(data ),
              //dataType:"json",
              contentType:"application/json",
              success: function (response) {
            	  alert("성공");
                  // 로그인이 성공하면 서버에서 리다이렉트 URL을 전송
                  window.location.href = "/main";
              },
              error: function () {
                  alert("로그인 실패");
              }
          });
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
