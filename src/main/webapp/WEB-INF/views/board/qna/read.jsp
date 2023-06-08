<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>
  .qnaRtop {
    display: inline;
    width: 150px;
    border-bottom: 1px solid black;
  }
  .qnaRtop h1 {
    display: contents;
    font-size: 30px;
  }
  .qnaRtop p {
    font-size: 15px;
    color: #8b8b8b;
    margin: 20px 0 50px 0;
  }

  .qnaRtable {
    border: 1px solid #d5d5d5;
    width: 1200px;
  }
  .qnaRtable tr {
    text-align: left;
    text-indent: 10px;
    line-height: 3;
    font-size: 13px;
    border-bottom: 1px dotted #d5d5d5;
  }
  .qnaRtable tr textarea {
    border: none;
    width: 1180px;
    height: 600px;
  }
  .qnaRtable tr th {
    width: 120px;
    text-align: center;
  }
  .qnaRtable tr td,
  .qnaRtable tr td p {
    width: 250px;
    background-color: white;
  }
  .qnaRtable tr:nth-child(3) td {
    height: 600px;
  }
  .qnaRtable tr:nth-child(3) td p {
    width: 1180px;
    margin: 5px auto 5px auto;
  }
  
  .qnaRbottom {
    display: flex;
    justify-content: space-between;
    padding-top: 30px;
    margin-bottom: 80px;
  }
  .qnaRbottom a {
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
  .qnaRbottom a:hover {
  border: 1px solid black;
  background-color: white;
  color: black;
  }
</style>

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
