<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>
  .noticeRtop {
    font-weight: 900;
    margin: 20px 0 50px 0;
  }
  .noticeRtop h1 {
    display: contents;
    font-size: 30px;
  }

  .noticeRtable {
    border: 1px solid #8b8b8b;
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
  .noticeRtable tr td {
    width: 250px;
    background-color: white;
  }
  .ck.ck-editor__editable_inline {
    background-color: white;
    height: 600px;
  }
  .ck.ck-editor__editable_inline>p {
    background-color: white;
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
    color: black;
    width: 140px;
    height: 35px;
    padding-top: 10px;
    background-color: #d5d5d5;
  }
  .noticeRbottom button {
    width: 140px;
  }
</style>

<div class="noticeRtop">
  <h1>NOTICE</h1>
</div>

<div class="noticeRmain">
  <table class="noticeRtable">
    <tr>
      <th>SUBJECT</th>
      <td>${output.subject}</td>
    </tr>
    <tr>
      <td colspan="2">
        ${output.content}
      </td>
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
