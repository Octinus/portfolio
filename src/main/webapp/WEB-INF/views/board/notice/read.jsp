<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  <p>고객 상세 페이지</p>
  <p>제목 : ${output.subject}</p>
  <p>내용 : ${output.content}</p>
  <a href="${contextPath}/notice">LIST</a>
  <a href="${contextPath}/cust/edit.do?id=${output.id}">EDIT</a>
  <c:import url="/WEB-INF/views/inc/bottom.jsp" />
