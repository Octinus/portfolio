<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/tech_read.css" />

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
