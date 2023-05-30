<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />
<style>
  .logintop {
    margin: 20px auto 80px auto;
    font-size: 25px;
    width: 100px;
    border-bottom: 1px solid black;
  }
  .logintop h1 {
    padding-bottom: 10px;
  }

  .loginmain {
    line-height: 2;
    width: 300px;
    margin: 0 auto 200px auto;
    padding-bottom: 150px;
    border-bottom: 1px solid black;
  }
  .loginmain table {
    margin: auto;
  }
  .loginmain tr {
    width: 190px;
  }
  .loginmain th {
    text-align: left;
    font-size: 13px;
  }
  .loginmain tr input {
    border: 1px solid black;
    width: 190px;
  }
  .loginmain table tr:nth-child(4) {
    height: 50px;
  }
  .loginmain table tr:nth-child(5) {
    height: 50px;
  }
  .loginmain table tr:nth-child(6),
  .loginmain table tr:nth-child(7) {
    text-align: left;
    font-size: 10px;
  }
  .loginmain table tr:nth-child(6) a,
  .loginmain table tr:nth-child(7) a {
    text-decoration: none;
    color: black;
  }
  .loginmain table tr:nth-child(7) {
    height: 50px;
  }
  .login table tr:last-child {
    height: 50px;
  }
  .loginbtn {
    width: 190px;
    height: 30px;
    background-color: black;
    color: white;
    border: 1px solid black;
    transition: all 0.5s;
  }
  .loginbtn:hover {
    background-color: #f7f7f7;
    color: black;
    border: 1px solid black;
  }
  .joina {
    display: block;
    height: 30px;
    color: black;
    text-decoration: none;
    background-color: #d5d5d5;
    transition: all 0.5s;
  }
  .joina:hover {
    background-color: #f7f7f7;
    color: black;
    border: 1px solid black;
  }
</style>

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