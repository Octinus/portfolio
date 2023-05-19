<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
          <c:import url="/WEB-INF/views/inc/top.jsp" />
          <style>
            .main div {
              padding-top: 30px;
            }
            .main label {
              background-color: #d5d5d5;
            }
          </style>

          <div>

          </div>

          <div>
            <label for="userid">ID
              <br />
              <input type="text" id="userid" name="userid" />
            </label>
            <br />
            <label for="userpw">PASSWORD
              <br />
              <input type="password" id="userpw" name="userpw" />
            </label>
          </div>

          <div>

          </div>


          <c:import url="/WEB-INF/views/inc/bottom.jsp" />