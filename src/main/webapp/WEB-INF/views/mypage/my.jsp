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
  <form class="myinfo">
    <table>
      <tr>
        <th>나의정보</th>
        <th><span>*</span>필수입력사항</th>
      </tr>
      <tr>
        <th><label for="name">이름<span>*</span></label></th>
        <td><input type="text" name="name" id="name" placeholder="이름"/></td>
      </tr>
      <tr>
        <th><label for="userid">아이디<span>*</span></label></th>
        <td><input type="text" name="userid" id="userid" placeholder="아이디"/> (영문소문자/숫자, 4~16자)</td>
      </tr>
      <tr>
        <th><label for="userpw">비밀번호<span>*</span></label></th>
        <td><input type="password" name="userpw" id="userpw" placeholder="비밀번호"/> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
      </tr>
      <tr>
        <th><label for="userpwre">비밀번호 확인<span>*</span></label></th>
        <td><input type="password" name="userpwre" id="userpwre" placeholder="비밀번호 확인"/> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
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
          <input type="tel" name="tel" id="tel" /> (연락 가능한 번호를 적어주세요.)</td>
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
        <th><label for="carnum">자동차번호<span>*</span></label></th>
        <td><input type="text" name="carnum" id="carnum" placeholder="자동차번호"/></td>
      </tr>
      <tr>
        <th><label for="carmodel">차종<span>*</span></label></th>
        <td><input type="text" name="carmodel" id="carmodel" placeholder="차종"/></td>
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
    <div class="editbtn">    		
      <button type="submit">EDIT</button>
      <a href="${contextPath}/">HOME</a>
    </div>
  </form>
</div>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />