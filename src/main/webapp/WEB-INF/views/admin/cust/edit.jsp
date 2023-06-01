<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />
    <h1>회원 정보 수정</h1>
    
    <div class="myinfo-container">
      <form class="myinfo" method="post" action="${contextPath}/my_edit_ok">
        <input type="hidden" name="id" id="id" value="${output.id}"/>
        <input type="hidden" name="mem_type" id="mem_type" value="C" />
        <input type="hidden" name="is_out" id="is_out" value="N" />
        <input type="hidden" name="edit_date" id="edit_date" value="" />
        <table>
          <tr>
            <th>고객 정보</th>
          </tr>
          <tr>
            <th><label for="name">이름</label></th>
            <td><input type="text" name="name" id="name" value="${output.name}" readonly /></td>
          </tr>
          <tr>
            <th><label for="userid">아이디</label></th>
            <td><input type="text" name="mem_id" id="mem_id" value="${output.mem_id}" readonly /></td>
          </tr>
          <tr>
            <th><label for="tel">연락처</label></th>
            <td>
              <select name="tel">
                <option value="${output.tel.substring(0, 3)}">${output.tel.substring(0, 3)}</option>
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
                <option value="02">02</option>
                <option value="031">031</option>
                <option value="032">032</option>
                <option value="033">033</option>
                <option value="041">041</option>
                <option value="042">042</option>
                <option value="043">043</option>
                <option value="044">044</option>
                <option value="051">051</option>
                <option value="052">052</option>
                <option value="053">053</option>
                <option value="054">054</option>
                <option value="055">055</option>
                <option value="061">061</option>
                <option value="062">062</option>
                <option value="063">063</option>
                <option value="064">064</option>
            </select>
            -
              <input type="tel" name="tel" id="tel" value="${output.tel.substring(4, 8)}" />
              -
              <input type="tel" name="tel" id="tel" value="${output.tel.substring(9)}" /></td>
          </tr>
          <tr>
            <th><label for="email">E-mail</label></th>
            <td><input type="email" name="email" id="email" value="${output.email}"/></td>
          </tr>
          <tr>
            <th><label for="birthdate">생년월일</label></th>
            <td><input type="date" name="birthdate" id="birthdate" value="${output.birthdate}" readonly /></td>
          </tr>
          <tr>
            <th><label for="carnum">자동차번호</label></th>
            <td><input type="text" name="carno" id="carno" value="${output.carno}"/></td>
          </tr>
          <tr>
            <th><label for="carmodel">차종</label></th>
            <td><input type="text" name="carmo" id="carmo" value="${output.carmo}"/></td>
          </tr>
          <tr>
            <th rowspan="3"><label for="postcode">주소</th>
            <td>
            <input type="tel" name="postcode" id="postcode" value="${output.postcode}"/><button type="button" onclick="check_Postcode()">우편번호 ></button>
            <br />
            <input type="text" name="addr1" id="addr1" value="${output.addr1}"/>
            <br />
            <input type="text" name="addr2" id="addr2" value="${output.addr2}"/>
          </td>
          </tr>
          </label>
        </table>
        <div class="editbtn">    		
          <button type="submit">EDIT</button>
          <button type="reset">RESET</button>
          <a href="${contextPath}/customermanagement">LIST</a>
        </div>
      </form>
    </div>
    <c:import url="/WEB-INF/views/inc/bottom.jsp" />