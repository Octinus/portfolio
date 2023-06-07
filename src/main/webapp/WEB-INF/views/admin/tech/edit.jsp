<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>
  .techEtop {
    font-weight: 900;
    margin: 20px 0 50px 0;
  }
  .techEtop h1 {
    display: contents;
    font-size: 30px;
  }

  .techEmain {
    width: 600px;
    margin: auto;
  }
  .techEmain .techEdit {
    width: 600px;
  }
  
  .techEmain .techEtable {
    width: 600px;
    line-height: 3;
  }
  .techEmain .techEtable tr {
    text-align: left;
    font-size: 15px;
    border-bottom: 1px dotted #d5d5d5;
  }
  .techEmain .techEtable tr:last-child {
    border-bottom: 1px solid #d5d5d5;
  }
  .techEmain .techEtable tr:first-child th {
    text-align: left;
    font-size: 12px;
    color: #b9b9b9;
    border: none;
  }
  .techEmain .techEtable tr:nth-child(2) input,
  .techEmain .techEtable tr:nth-child(3) input,
  .techEmain .techEtable tr:nth-child(4) input,
  .techEmain .techEtable tr:nth-child(5) input,
  .techEmain .techEtable tr:nth-child(7) input {
    width: 100px;
  }
  .techEmain .techEtable tr th {
    border-left: 1px solid #d5d5d5;
  }
  .techEmain .techEtable tr td {
    padding-left: 10px;
    border-right: 1px solid #d5d5d5;
  }
  .techEmain .techEtable tr:nth-child(10) button {
    margin-left: 10px;
    border: 1px solid #d5d5d5;
  }
  .techEmain .techEtable tr input {
    background-color: white;
    border: 1px solid #d5d5d5;
  }
  .techEmain .techEtable tr select,
  .techEmain .techEtable tr option {
    background-color: white;
    width: 60px;
  }
  .techEmain .techEtable tr:nth-child(2) {
    border-top: 2px solid #d5d5d5;
  }
  .techEmain .techEtable tr th {
    width: 80px;
    text-align: center;
  }
  .techEmain .techEtable tr td {
    width: 250px;
    background-color: white;
  }

  .techEbottom {
    width: 600px;
    display: flex;
    justify-content: space-between;
    padding-top: 30px;
    margin: 30px auto 80px auto;
  }
  .techEbottom a {
    text-decoration: none;
    display: block;
    font-size: 13px;
    color: white;
    width: 140px;
    height: 35px;
    padding-top: 10px;
    background-color: black;
  }
  .techEbottom button {
    width: 140px;
    cursor: pointer;
    border: 1px solid black;
    color: white;
    background-color: black;
  }
</style>

<div class="techEtop">
  <h1>정비사 정보 수정</h1>
</div>

<div class="techEmain">
  <form class="techEdit" method="post" action="${contextPath}/tech/edit_ok.do">
    <input type="hidden" name="id" id="id" value="${output.id}"/>
    <input type="hidden" name="mem_type" id="mem_type" value="${output.mem_type}" />
    <input type="hidden" name="is_out" id="is_out" value="${output.is_out}" />
    <input type="hidden" name="reg_date" id="reg_date" value="${output.reg_date}" />
    <input type="hidden" name="edit_date" id="edit_date" value="${output.edit_date}" />
    <table class="techEtable">
      <tr>
        <th><span style="color: red;">*</span>정비사 정보</th>
      </tr>
      <tr>
        <th><label for="name">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label></th>
        <td><input type="text" name="name" id="name" value="${output.name}" readonly /></td>
      </tr>
      <tr>
        <th><label for="mem_id">아&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;디</label></th>
        <td><input type="text" name="mem_id" id="mem_id" value="${output.mem_id}" readonly /></td>
      </tr>
      <tr>
        <th><label for="userpw">비&nbsp;밀&nbsp;번&nbsp;호</label></th>
        <td><input type="password" name="mem_pw" id="mem_pw" value="${output.mem_pw}"/></td>
      </tr>
      <tr>
        <th><label for="userpwre">비밀번호 확인</label></th>
        <td><input type="password" name="mem_pwre" id="mem_pwre" value="${output.mem_pw}"/></td>
      </tr>
      <tr>
        <th><label for="level">등&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</label></th>
        <td>
          <select name="level">
            <option value="${output.level}">${output.level}</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
          </select>
        </td>
      </tr>
      <tr>
        <th><label for="tel">연&nbsp;&nbsp;&nbsp;락&nbsp;&nbsp;&nbsp;처</label></th>
        <td>
          <select name="tel">
            <option value="${output.tel.substring(0, 3)}">${output.tel.substring(0, 3)}</option>
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
          <input type="tel" name="tel" id="tel" value="${output.tel.substring(4, 8)}" />
          -
          <input type="tel" name="tel" id="tel" value="${output.tel.substring(9)}" /></td>
      </tr>
      <tr>
        <th><label for="email">E&nbsp;&nbsp;-&nbsp;&nbsp;MAIL</label></th>
        <td><input type="email" name="email" id="email" value="${output.email}"/></td>
      </tr>
      <tr>
        <th><label for="birthdate">생&nbsp;년&nbsp;월&nbsp;일</label></th>
        <td><input type="date" name="birthdate" id="birthdate" value="${output.birthdate}" readonly /></td>
      </tr>
      <tr>
        <th rowspan="3"><label for="postcode">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
        <td>
        <input type="tel" name="postcode" id="postcode" value="${output.postcode}"/><button type="button" onclick="check_Postcode()">우편번호 ></button>
        <br />
        <input type="text" name="addr1" id="addr1" value="${output.addr1}"/>
        <br />
        <input type="text" name="addr2" id="addr2" value="${output.addr2}"/>
      </td>
      </tr>
      </label>
    </table>
    <div class="techEbottom">    		
      <button type="submit">EDIT</button>
      <button type="reset">RESET</button>
      <a href="${contextPath}/techmanagement">LIST</a>
    </div>
  </form>
</div>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />