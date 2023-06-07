<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />
<style>
  .techRtop {
    font-weight: 900;
    margin: 20px 0 50px 0;
  }
  .techRtop h1 {
    display: contents;
    font-size: 30px;
  }

  .techRmain {
    width: 600px;
    margin: auto;
  }
  
  .techRtable {
    width: 600px;
    border: 1px solid #d5d5d5;
  }
  .techRtable tr {
    text-align: left;
    text-indent: 10px;
    line-height: 3;
    font-size: 13px;
    border-bottom: 1px dotted #d5d5d5;
  }
  .techRtable tr:first-child {
    border-top: 2px solid #d5d5d5;
  }
  .techRtable tr th {
    width: 80px;
    text-align: center;
  }
  .techRtable tr td {
    width: 250px;
    background-color: white;
  }

  .techRbottom {
    width: 600px;
    display: flex;
    justify-content: space-between;
    padding-top: 30px;
    margin: 30px auto 80px auto;
  }
  .techRbottom a {
    text-decoration: none;
    display: block;
    font-size: 13px;
    color: white;
    width: 140px;
    height: 35px;
    padding-top: 10px;
    background-color: black;
  }
  .techRbottom button {
    width: 140px;
  }
</style>

<div class="techRtop">
  <h1>정비사 상세 페이지</h1>
</div>

<div class="techRmain">
  <table class="techRtable">
    <tr>
      <th>이름</th>
      <td>${output.name}</td>
    </tr>
    <tr>
      <th>등급</th>
      <td>${output.level}</td>
    </tr>
    <tr>
      <th>아이디</th>
      <td>${output.mem_id}</td>
    </tr>
    <tr>
      <th>연락처</th>
      <td>${output.tel}</td>
    </tr>
    <tr>
      <th>E-mail</th>
      <td>${output.email}</td>
    </tr>
    <tr>
      <th>생년월일</th>
      <td>${output.birthdate}</td>
    </tr>
    <tr>
      <th>우편번호</th>
      <td>${output.postcode}</td>
    </tr>
    <tr>
      <th>기본주소</th>
      <td>${output.addr1}</td>
    </tr>
    <tr>
      <th>상세주소</th>
      <td>${output.addr2}</td>
    </tr>
    <tr>
      <th>입사일</th>
      <td>${output.reg_date}</td>
    </tr>
    <tr>
      <th>개인정보 수정일</th>
      <td>${output.edit_date}</td>
    </tr>
    <tr>
      <th>탈퇴여부</th>
      <td>${output.is_out}</td>
    </tr>
  </table>
</div>

<div class="techRbottom">
  <a href="${contextPath}/techmanagement">LIST</a>
  <a href="${contextPath}/tech/edit.do?id=${output.id}">EDIT</a>
</div>
<c:import url="/WEB-INF/views/inc/bottom.jsp" />
