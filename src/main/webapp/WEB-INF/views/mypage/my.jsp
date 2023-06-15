<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />
<style>
  .myinfotop {
    margin: 20px auto 80px auto;
    font-size: 25px;
    width: 100px;
    border-bottom: 1px solid black;
  }
  .myinfotop h1 {
    padding-bottom: 10px;
  }

  .myinfo table {
    margin-bottom: 80px;
    line-height: 2.5;
  }
  .myinfo table span {
    color: red;
  }
  
  .myinfo th,
  .myinfo td{
    border: 1px solid #c5c5c5;
  }
  .myinfo tr:nth-child(14) td {
    border: none;
    text-align: right;
  }
  .myinfo tr:nth-child(14) td a {
    text-decoration: none;
    background-color: black;
    color: white;
    border: 1px solid black;
    padding: 2px;
    transition: all 0.5s;
  }
  .myinfo tr:nth-child(14) td a:hover {
    background-color: #f7f7f7;
    color: black;
    border: 1px solid black;
  }
  .myinfo > table tr:nth-child(1) th {
    border: none;
    font-size: 12px;
    font-weight: 600;
    padding-bottom: 10px;
  }
  .myinfo > table tr:nth-child(1) th:last-child {
    text-align: right;
    font-weight: 300;
  }
  .myinfo > table tr:nth-child(2) {
    border-top: 2px solid #c5c5c5;
  }
  .myinfo th {
    width: 130px;
    text-align: left;
  }
  .myinfo td {
    width: 1070px;
    height: 30px;
    text-align: left;
    font-size: 12px;
  }
  .myinfo th label {
    margin-left: 20px;
    font-size: 13px;
    font-weight: 100;
  }
  .myinfo td select {
    margin: 5px 0 5px 20px;
  }
  .myinfo tr:nth-child(6) input {
    margin: 5px 0 5px 0px;
    width: 80px;
  }
  .myinfo tr:nth-child(7) input:nth-child(2) {
    margin: 5px 0 5px 0px;
  }
  .myinfo .switchreserv {
    text-indent: 5px;
    text-decoration: none;
    background-color: #a3a3a3;
    color: white;
    border: 1px solid #a3a3a3;
    transition: all 0.5s;
    margin-left: 5px;
    padding: 3px 0 1.5px 0;
  }
  .myinfo .switchreserv:hover {
    background-color: #f7f7f7;
    color: black;
    border: 1px solid #a3a3a3;
  }
  .myinfo td input {
    margin: 5px 0 5px 20px;
    border: 1px solid #a3a3a3;
  }
  .myinfo td button {
    border: 1px solid #a3a3a3;
    margin-left: 5px;
    cursor: pointer;
  }

  .editbtn {
    margin-bottom: 150px;
    display: inline-flex;
    
  }
  .myinfo .editbtn button {
    width: 150px;
    height: 30px;
    font-size: 12px;
    font-weight: 300;
    background-color: black;
    color: white;
    border: 1px solid black;
    margin-right: 10px;
    transition: all 0.5s;
  }
  .myinfo .editbtn button:hover {
    background-color: #f7f7f7;
    color: black;
    border: 1px solid black;
  }
  .myinfo .editbtn a {
    display: block;
    width: 150px;
    height: 30px;
    font-size: 12px;
    font-weight: 300;
    background-color: black;
    color: white;
    border: 1px solid black;
    padding-top: 7px;
    transition: all 0.5s;
    text-decoration: none;
  }
  .myinfo .editbtn a:hover {
    background-color: #f7f7f7;
    color: black;
    border: 1px solid black;
  }
</style>

<div class="myinfotop">
  <h1>PROFILE</h1>
</div>

<div class="myinfo-container">
  <form class="myinfo" method="post" action="${contextPath}/myEdit.ok">
    <input type="hidden" name="id" id="id" value="${login_info.getId()}"/>
    <input type="hidden" name="mem_type" id="mem_type" value="C" />
    <input type="hidden" name="is_out" id="is_out" value="N" />

    <table>
      <tr>
        <th>나의정보</th>
        <th><span>*</span>필수입력사항</th>
      </tr>
      <tr>
        <th><label for="name">이름<span>*</span></label></th>
        <td><input type="text" name="name" id="name" value="${login_info.getName()}" readonly /></td>
      </tr>
      <tr>
        <th><label for="userid">아이디<span>*</span></label></th>
        <td><input type="text" name="mem_id" id="mem_id" value="${login_info.getMem_id()}" readonly /></td>
      </tr>
      <tr>
        <th><label for="userpw">비밀번호<span>*</span></label></th>
        <td><input type="password" name="mem_pw" id="mem_pw" value="${login_info.getMem_pw()}"/></td>
      </tr>
      <tr>
        <th><label for="userpwre">비밀번호 확인<span>*</span></label></th>
        <td><input type="password" name="mem_pwre" id="mem_pwre" placeholder="비밀번호 확인"/></td>
      </tr>
      <tr>
        <th><label for="tel">연락처<span>*</span></label></th>
        <td>
          <select name="tel">
            <option value="${login_info.getTel().substring(0, 3)}">${login_info.getTel().substring(0, 3)}</option>
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
          <input type="tel" name="tel" id="tel" value="${login_info.getTel().substring(4, 8)}" />
          -
          <input type="tel" name="tel" id="tel" value="${login_info.getTel().substring(9)}" /></td>
      </tr>
      <c:if test="${login_info.getMem_type().equals('C')}">
      <tr>
        <th><label for="booking_date">예약 일자</label></th>
        <td><input type="text" name="booking_date" id="booking_date" value= "${login_info.getBooking_date()}" readonly /><a href="${contextPath}/reservation" class="switchreserv">예약변경</a></td>
      </tr>
      <tr>
        <th><label for="booking_time">예약 시간</label></th>
        <td><input type="text" name="booking_time" id="booking_time" value= "${login_info.getBooking_time()}" readonly /></td>
      </tr>
      </c:if>
      <tr>
        <th><label for="email">E-mail<span>*</span></label></th>
        <td><input type="email" name="email" id="email" value="${login_info.getEmail()}"/></td>
      </tr>
      <tr>
        <th><label for="birthdate">생년월일<span>*</span></label></th>
        <td><input type="date" name="birthdate" id="birthdate" value="${login_info.getBirthdate()}"/></td>
      </tr>
      <c:if test="${login_info.getMem_type().equals('C')}">
      <tr>
        <th><label for="carno">자동차번호<span>*</span></label></th>
        <td><input type="text" name="carno" id="carno" value="${login_info.getCarno()}"/></td>
      </tr>
      <tr>
        <th><label for="carmo">차종<span>*</span></label></th>
        <td><input type="text" name="carmo" id="carmo" value="${login_info.getCarmo()}"/></td>
      </tr>
      </c:if>
      <tr>
        <th><label for="postcode">주소<span>*</span></label></th>
        <td>
        <input type="tel" name="postcode" id="postcode" value="${login_info.getPostcode()}"/><button type="button" onclick="check_Postcode()">우편번호 ></button>
        <br />
        <input type="text" name="addr1" id="addr1" value="${login_info.getAddr1()}"/>
        <br />
        <input type="text" name="addr2" id="addr2" value="${login_info.getAddr2()}"/>
      </td>
      </tr>
      <c:if test="${login_info.getMem_type().equals('C')}">
      <tr>
        <td colspan="2"><a href="${contextPath}/my/drop.do?id=${login_info.getId()}">회원탈퇴</a></td>
      </tr>
      </c:if>
    </table>
    <div class="editbtn">    		
      <button type="submit">EDIT</button>
      <a href="${contextPath}/">HOME</a>
    </div>
  </form>
</div>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />