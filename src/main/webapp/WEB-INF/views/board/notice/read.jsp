<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>
  .noticeRtop {
    display: inline;
    width: 150px;
    border-bottom: 1px solid black;
  }
  .noticeRtop h1 {
    display: contents;
    font-size: 30px;
  }
  .noticeRtop p {
    font-size: 15px;
    color: #8b8b8b;
    margin: 20px 0 50px 0;
  }

  .noticeRtable {
    border: 1px solid #d5d5d5;
    width: 1200px;
  }
  .noticeRtable tr {
    text-align: left;
    text-indent: 10px;
    line-height: 3;
    font-size: 13px;
    border-bottom: 1px dotted #d5d5d5;
  }
  .noticeRtable tr textarea {
    border: none;
    width: 1180px;
    height: 600px;
  }
  .noticeRtable tr th {
    width: 120px;
    text-align: center;
  }
  .noticeRtable tr td,
  .noticeRtable tr td p {
    width: 250px;
    background-color: white;
  }
  .noticeRtable tr:nth-child(3) td {
    height: 600px;
  }
  .noticeRtable tr:nth-child(3) td p {
    width: 1180px;
    margin: 5px auto 5px auto;
  }
  
  .noticeRbottom {
    display: flex;
    justify-content: space-between;
    padding-top: 30px;
    margin-bottom: 80px;
  }
  .noticeRbottom a {
    text-decoration: none;
    display: block;
    font-size: 13px;
    color: white;
    width: 140px;
    height: 35px;
    padding-top: 10px;
    background-color: black;
    transition: all 0.5s;
  }
  .noticeRbottom a:hover {
  border: 1px solid black;
  background-color: white;
  color: black;
  }
</style>

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
