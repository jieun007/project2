<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>회원 가입 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script
      integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"
    ></script>
    <script>
      $(document).ready(function () {
        $("#checkid").click(function (e) {
          e.preventDefault();
          console.log("아이디 중복 확인 버튼이 눌려요");
          $.ajax({
              url: "/register/confirmId?id=" + $("#id").val(),
              success: function (data) {
                console.log("성공", data);
                alert("중복된 아이디야!")
            },
            error: function (data) {
               
                alert("중복되지 않는 아이디야!")
            },
          });
        });

        $("button#select").click(function (e) {
          e.preventDefault();
          console.log("지역 선택 버튼이 눌려요");
          
          validateInterest();
        });

        $(".btn.button").click(function (e) {
        	console.log(cnt)
        	var hiddenInput=''
        	if(cnt==3) {
        		$.each(selectedArea,function(idx,area){
	        		const fieldName = "userArea"+(idx + 1);
				    const fieldValue = area;
				    console.log(fieldName , fieldValue)
				     hiddenInput+= '<input type="hidden" name="'+ fieldName +'" value="'+fieldValue + '"></input>';
        		})
        		console.log(hiddenInput)
        		//e.preventDefault()
        		$("form").append(hiddenInput);
        		$("form").submit();
        		cnt=0;
        	} else{
        		alert("3개 선택해")
        	}
        	
        }); 
        
      });
      
      function alert(mgs) {
          Swal.fire(mgs);
        }
    </script>
    <script>
      const interestAreas = [
        "도봉구",
        "강북구",
        "노원구",
        "성북구",
        "은평구",
        "종로구",
        "동대문구",
        "중랑구",
        "서대문구",
        "중구",
        "성동구",
        "마포구",
        "용산구",
        "광진구",
        "강동구",
        "송파구",
        "강남구",
        "서초구",
        "동작구",
        "관악구",
        "영등포구",
        "구로구",
        "양천구",
        "강서구",
      ];
    </script>
    <script>
    $(document).ready(function () {
        $("input[name='userPasswordCheck']").keyup(function () {
             var password = $("input[name='userPassword']").val();
             var confirmPassword = $(this).val();
             var passwordMatchMessage = $("#passwordMatchMessage");

             if (password === confirmPassword) {
                 passwordMatchMessage.text("비밀번호 일치").css("color", "green");
             } else {
                 passwordMatchMessage.text("비밀번호 불일치").css("color", "red");
             }
         });
     });
   </script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/agebox.css" />
  </head>
  <body>
    <% request.setCharacterEncoding("UTF-8"); %>
    <div class="login-box" style="color: white">
      <header class="form-header">
        <h1 style="text-align: center">(☞ﾟヮﾟ)☞가입해</h1>
      </header>
      <form class="form-row" action="/register/join" method="post">
        <div class="user-box">
          <input type="text" value="${i.userName}" name="userName" />
          <label>이름</label>
        </div>
        <div class="user-box">
          <input
            type="text"
            class="form-control"
            value="${i.userID}"
            id="id"
            aria-describedby="emailHelp"
            name="userID" required
          />
          <label for="exampleInputEmail1">아이디</label>
        </div>

        <a href="#" class="btn-primary" style="left: 200px" id="checkid">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          중복확인
        </a>

        <div class="user-box">
          <input type="text" value="${i.userPassword}" name="userPassword" />
          <label>비밀번호</label>
        </div>
        <div class="user-box">
          <input type="text" value="${i.userPasswordCheck}" name="userPasswordCheck" />
          <label>비밀번호 확인</label>
        </div>
        <div id="passwordMatchMessage"></div>
        <div class="selectBox">
          <div class="selectBox2">
            <button
              id="age"
              class="label"
              style="color: white; text-align: right"
            >
              나이 (❁´◡`❁)
            </button>
            <select class="optionList" name="userAge">
              <option class="optionItem" id="10" value="10대（⊙ｏ⊙）">
                10대（⊙ｏ⊙）
              </option>
              <option class="optionItem" id="20" value="20대(●'◡'●)">
                20대(●'◡'●)
              </option>
              <option class="optionItem" id="30" value="30대╰(*°▽°*)╯">
                30대╰(*°▽°*)╯
              </option>
              <option class="optionItem" id="40" value="40대(￣ε(#￣)">
                40대(￣ε(#￣)
              </option>
              <option class="optionItem" id="50" value="50대o((>ω< ))o">
                50대o((>ω< ))o
              </option>
              <option class="optionItem" id="60" value="60대（︶^︶）">
                60대（︶^︶）
              </option>
              <option class="optionItem" id="70" value="70대(　TロT)σ">
                70대(　TロT)σ
              </option>
              <option class="optionItem" id="80" value="80대q(≧▽≦q)">
                80대q(≧▽≦q)
              </option>
              <option class="optionItem" id="90" value="90대♪(´▽｀)">
                90대♪(´▽｀)
              </option>
              <option class="optionItem" id="100" value="100대(*￣3￣)╭">
                100대(*￣3￣)╭
              </option>
            </select>
          </div>
		  <span></span>
          <span></span>
          <span></span>
        </div>
        <div>
          <fieldset
            class="legacy-form-row"
            style="border-color: rgb(128, 227, 240)"
          >
            <input
              id="gender-type-1"
              name="userSex"
              type="radio"
              value="남자"
            />
            <label for="gender-type-1" class="radio-label">남자</label>
            <input
              id="gender-type-2"
              name="userSex"
              type="radio"
              value="여자"
              checked
            />
            <label for="gender-type-2" class="radio-label">여자</label>
            <input
              id="gender-type-3"
              name="userSex"
              type="radio"
              value="비공개"
              checked
            />
            <label for="gender-type-3" class="radio-label">비공개</label>
          </fieldset>
        </div>

        <div class="interest">
          <label for="interest_area">관심 지역 (최대 3개 선택)</label>
          <div id="interestCheckboxes"></div>
          </div>
        <div>
          <a
            href="#"
            class="btn button"
            style="margin-top: 10px; margin-left: 200px"
          >
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            가입하기
          </a>
        </div>
      </form>
    </div>
    <script src="/resources/js/join.js"></script>
  </body>
</html>
