<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  <p>${output.subject}</p>
  <p>제목 : ${output.subject}</p>
  <p>내용 : ${output.content}</p>
  <a href="${contextPath}/notice">LIST</a>
  <c:if test="${login_info.getMem_type().equals('A')}">
    <a href="${contextPath}/notice/edit.do?id=${output.id}">EDIT</a>
  </c:if>
  <c:import url="/WEB-INF/views/inc/bottom.jsp" />
