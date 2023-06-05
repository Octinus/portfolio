<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <c:import url="/WEB-INF/views/inc/top.jsp" />
  <style>
    .notiEtop {
      margin-bottom: 50px;
    }
    .noticetable {
      border: 1px solid #8b8b8b;
      width: 1200px;
    }
    .noticetable tr {
      text-align: left;
      text-indent: 10px;
      line-height: 3;
      font-size: 13px;
    }
    .noticetable input {
      border: 1px solid #8b8b8b;
      background-color: white;
    }
    .ck.ck-editor__editable_inline>:last-child {
      height: 600px;
      background-color: white;
    }
    .notiEbottom {
      display: flex;
      justify-content: space-between;
      padding-top: 30px;
    }
    .notiEbottom a {
      text-decoration: none;
      display: block;
      font-size: 13px;
      color: black;
      width: 140px;
      height: 35px;
      padding-top: 10px;
      background-color: #d5d5d5;
    }
    .notiEbottom button {
      width: 140px;
    }
  </style>
  <p class="notiEtop">NOTICE</p>

  <form method="post" action="${contextPath}/notice/add_ok.do" enctype="multipart/form-data">
    <input type="hidden" name="category" id="category" value="N" />
    <input type="hidden" name="reg_date" id="reg_date" value="" />
    <input type="hidden" name="members_id" id="members_id" value="${login_info.getId()}" />
  <table class="noticetable">
    <tr>
      <th>SUBJECT</th>
      <td><input type="text" name="subject" id="subject" value="${output.subject}"/></td>
    </tr>
    <tr>
      <td colspan="2">
        <textarea name="content" id="content">${output.content}</textarea>
      </td>
    </tr>
    <tr>
      <th>첨부파일</th>
      <td>
        <input type="file" name="file" id="file" />
      </td>
    </tr>
  </table>
  <div class="notiEbottom">
    <a href="${contextPath}/notice">LIST</a>
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