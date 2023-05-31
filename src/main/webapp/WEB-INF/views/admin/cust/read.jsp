<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  <p>고객 상세 페이지</p>
  <p>이름 : ${output.name}</p>
  <p>아이디 : ${output.mem_id}</p>
  <p>연락처 : ${output.tel}</p>
  <p>E-mail : ${output.email}</p>
  <p>생년월일 : ${output.birthdate}</p>
  <p>차번호 : ${output.carno}</p>
  <p>차종 : ${output.carmo}</p>
  <p>우편번호 : ${output.postcode}</p>
  <p>기본주소 : ${output.addr1}</p>
  <p>상세주소 : ${output.addr2}</p>
  <p>가입일 : ${output.reg_date}</p>
  <p>개인정보 수정일 : ${output.edit_date}</p>
  <p>탈퇴여부 : ${output.is_out}</p>
  <hr />
  <a href="${contextPath}/customermanagement">LIST</a>
  <a href="${contextPath}/cust/edit.do?id=${output.id}">EDIT</a>
  <c:import url="/WEB-INF/views/inc/bottom.jsp" />
