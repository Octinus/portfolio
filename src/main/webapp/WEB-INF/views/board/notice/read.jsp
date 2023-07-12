<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/n_read.css" />

<div class="noticeRtop">
  <h1>NOTICE</h1>
  <p>공지사항</p>
</div>

<div class="noticeRmain">
  <table class="noticeRtable">
    <tr>
      <th>SUBJECT</th>
      <td colspan="3">${output.subject}</td>
    </tr>
    <tr>
      <th>NAME</th>
      <c:choose>
        <c:when test="${output.name.equals('관리자')}">
          <td>C.MOTORS</td>
        </c:when>
        <c:otherwise>
          <td>${output.name}</td>
        </c:otherwise>
      </c:choose>
      <th>DATE</th>
      <td>${output.reg_date}</td>
    </tr>
    <tr>
      <td colspan="4">${output.content}</td>
    </tr>
  </table>
</div>

<div class="noticeRbottom">
  <a href="${contextPath}/notice">LIST</a>
  <c:if test="${login_info.getMem_type().equals('A')}">
    <a href="${contextPath}/notice/edit.do?id=${output.id}">EDIT</a>
  </c:if>
</div>



<c:import url="/WEB-INF/views/inc/bottom.jsp" />
