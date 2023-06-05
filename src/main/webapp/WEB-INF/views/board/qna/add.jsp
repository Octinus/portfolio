<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  
  <style>
    .qnatop {
      padding-bottom: 40px;
    }
    .qnatable {
      border: 1px solid black;
      width: 1200px;
    }
    .qnatable tr {
      text-align: left;
      text-indent: 10px;
      line-height: 3;
      font-size: 13px;
    }
    .ck.ck-editor__editable_inline>:last-child {
      height: 600px;
      background-color: white;
    }
    .qnabottom {
      display: flex;
      justify-content: space-between;
      padding-top: 30px;
    }
    .qnabottom a {
      text-decoration: none;
      display: block;
      font-size: 13px;
      color: black;
      width: 140px;
      height: 35px;
      padding-top: 10px;
      background-color: #d5d5d5;
    }
    .qnabottom button {
      width: 140px;
    }
  </style>
  <p class="qnatop">Q&A</p>

  <form method="post" action="${contextPath}/qna/add_ok.do" enctype="multipart/form-data">
    <input type="hidden" name="category" id="category" value="Q" />
    <input type="hidden" name="reg_date" id="reg_date" value="" />
    <input type="hidden" name="members_id" id="members_id" value="${login_info.getId()}" />
  <table class="qnatable">
    <tr>
      <th>SUBJECT</th>
      <td><input type="text" name="subject" id="subject" /></td>
    </tr>
    <tr>
      <th>TYPE</th>
      <td>
        <select name="q_type">
          <option value="R">예약문의</option>
          <option value="P">부품문의</option>
          <option value="E">기타문의</option>
        </select> 
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <textarea name="content" id="content"></textarea>
      </td>
    </tr>
    <tr>
      <th>첨부파일</th>
      <td>
        <input type="file" name="file" id="file" />
      </td>
    </tr>
    <tr>
      <th>게시글비밀번호</th>
      <td>
        <input type="password" name="writer_pw" id="writer_pw" />
      </td>
    </tr>
  </table>
  <div class="qnabottom">
    <a href="${contextPath}/qna">LIST</a>
    <button type="submit">OK</button>
  </div>
</form>
  <script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
  <script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/translations/ko.js"></script>
    <script>
      ClassicEditor.create( document.querySelector( '#content' ), {

        toolbar: [
                  'heading',
                  '|',
                  'bold',
                  'italic',
                  'bulletedList',
                  'numberedList',
                  '|',
                  'undo',
                  'redo',
                  ],
        language: "ko"
  } );
    </script>

  <c:import url="/WEB-INF/views/inc/bottom.jsp" />