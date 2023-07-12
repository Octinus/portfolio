<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/login.css" />

<div class="logintop">
  <h1>LOG IN</h1>
</div>

<div class="loginmain">
  <table>
      <form method="post" action="${contextPath}/login_ok">
        <tr>
          <th><label for="mem_id">ID</label></th>
        </tr>
        <tr>
          <td><input type="text" id="mem_id" name="mem_id" /></td>
        </tr>
        <tr>
          <th><label for="mem_pw">PASSWORD</label></th>
        </tr>
        <tr>
          <td><input type="password" id="mem_pw" name="mem_pw" /></td>
        </tr>
        <tr>
        <td><button type="submit" class="loginbtn">Log In</button></td>
      </tr>
      </form>
      <tr>
      <td><a href="#">- SEARCH ID</a></td>
    </tr>
    <tr>
      <td><a href="#">- SEARCH PASSWORD</a></td>
    </tr>
    <tr>
      <td><a href="${contextPath}/join" class="joina">Join Member</a></td>
    </tr>
  </table>
</div>


<div class="loginbottom">

</div>


<c:import url="/WEB-INF/views/inc/bottom.jsp" />