<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/header.jsp" />

<header class="header">
  <h1>C MOTORS <i class="fa-solid fa-screwdriver-wrench"></i></i></h1>
</header>

<nav class="navi">
  <div class="content-container">
    <a href="/"><i class="fa-solid fa-house-chimney-window"></i>HOME</a>
    <ul>
      <li>
        <a href="#">최씨네</a>
        <a href="${contextPath}/introcenter">센터소개</a>
        <a href="${contextPath}/introtech">정비사소개</a>
      </li>
      <li>
        <a href="#">MYPAGE</a>
        <a href="${contextPath}/my">마이페이지</a>
        <a href="${contextPath}/reservation">예약하기</a>
      </li>
      <li>
        <a href="${contextPath}/record">정비이력</a>
      </li>
      <li>
        <a href="${contextPath}/notice">공지사항</a>
      </li>
      <li>
        <a href="${contextPath}/qna">자유게시판</a>
      </li>
    </ul>
  </div>
</nav>

<section class="main">
  <div class="content-container">