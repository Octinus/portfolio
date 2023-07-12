<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/q_read.css" />

<div class="qnaRtop">
  <h1>Q & A</h1>
  <p>자유롭게 이용하시는 게시판입니다.</p>
</div>

<div class="qnaRmain">
  <table class="qnaRtable">
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

<div class="qnaRbottom">
  <a href="${contextPath}/qna">LIST</a>
  <c:if test="${login_info.getMem_type().equals('A') || output.members_id == login_info.getId()}">
    <a href="${contextPath}/qna/edit.do?id=${output.id}">EDIT</a>
  </c:if>
</div>

<c:import url="/WEB-INF/views/inc/bottom.jsp" />
