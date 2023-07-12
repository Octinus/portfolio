<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/join.css" />

<div class="jointop">
  <h1>JOIN</h1>
</div>
    
<div class="join-container">
  <form action="${contextPath}/join_ok" method="post" class="join">
    <input type="hidden" name="mem_type" id="mem_type" value="C" />
    <input type="hidden" name="reg_date" id="reg_date" value="" />
    <input type="hidden" name="is_out" id="is_out" value="N" />
    <table border="1">
    <tr>
      <th colspan="2"><span>*</span>필수입력사항</th>
    </tr>
    <tr>
      <th><label for="name">이름<span>*</span></label></th>
      <td><input type="text" name="name" id="name" placeholder="이름"/></td>
    </tr>
    <tr>
      <th><label for="mem_id">아이디<span>*</span></label></th>
      <td><input type="text" name="mem_id" id="mem_id" placeholder="아이디"/> (영문소문자/숫자, 4~16자)</td>
    </tr>
    <tr>
      <th><label for="mem_pw">비밀번호<span>*</span></label></th>
      <td><input type="password" name="mem_pw" id="mem_pw" placeholder="비밀번호"/> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
    </tr>
    <tr>
      <th><label for="mem_pwre">비밀번호 확인<span>*</span></label></th>
      <td><input type="password" name="mem_pwre" id="mem_pwre" placeholder="비밀번호 확인"/> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
    </tr>
    <tr>
      <th><label for="tel">연락처<span>*</span></label></th>
      <td>
        <select name="tel">
          <option value="">--선택하세요--</option>
          <option value="010">010</option>
          <option value="011">011</option>
          <option value="016">016</option>
          <option value="017">017</option>
          <option value="018">018</option>
          <option value="019">019</option>
          <option value="02">02</option>
          <option value="031">031</option>
          <option value="032">032</option>
          <option value="033">033</option>
          <option value="041">041</option>
          <option value="042">042</option>
          <option value="043">043</option>
          <option value="044">044</option>
          <option value="051">051</option>
          <option value="052">052</option>
          <option value="053">053</option>
          <option value="054">054</option>
          <option value="055">055</option>
          <option value="061">061</option>
          <option value="062">062</option>
          <option value="063">063</option>
          <option value="064">064</option>
      </select>
      -
        <input type="tel" name="tel" id="tel" />
        -
        <input type="tel" name="tel" id="tel" /> (직접 연락 받으실 번호를 적어주세요.)</td>
    </tr>
    <tr>
      <th><label for="email">E-mail<span>*</span></label></th>
      <td><input type="email" name="email" id="email" /></td>
    </tr>
    <tr>
      <th><label for="birthdate">생년월일<span>*</span></label></th>
      <td><input type="date" name="birthdate" id="birthdate" placeholder="생년월일"/></td>
    </tr>
    <tr>
      <th><label for="carno">자동차번호<span>*</span></label></th>
      <td><input type="text" name="carno" id="carno" placeholder="자동차번호"/></td>
    </tr>
    <tr>
      <th><label for="carmo">차종<span>*</span></label></th>
      <td><input type="text" name="carmo" id="carmo" placeholder="차종"/></td>
    </tr>
    <tr>
      <th rowspan="3"><label for="postcode">주소<span>*</span></th>
      <td>
      <input type="tel" name="postcode" id="postcode" placeholder="우편번호"/><button type="button" onclick="check_Postcode()">우편번호 ></button>
      <br />
      <input type="text" name="addr1" id="addr1" placeholder="기본주소"/>
      <br />
      <input type="text" name="addr2" id="addr2" placeholder="상세주소"/>
    </td>
    </tr>
    </label>
    </table>
    <div class="joinbtn">
      <button type="submit">JOIN</button>
      <button type="reset">RESET</button>
    </div>
  </form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function check_Postcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ''; // 주소 변수
              var extraAddr = ''; // 참고항목 변수

              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              //if(data.userSelectedType === 'R'){
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraAddr !== ''){
                      extraAddr = ' (' + extraAddr + ')';
                  }
                  // 조합된 참고항목을 해당 필드에 넣는다.
                  //document.getElementById("addr2").value = extraAddr;
              
              //} else {
                  //document.getElementById("addr2").value = '';
              //}

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('postcode').value = data.zonecode;
              document.getElementById("addr1").value = addr + extraAddr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("addr2").focus();
          }
      }).open();
  }
</script>

<c:import url="/WEB-INF/views/inc/bottom.jsp" />