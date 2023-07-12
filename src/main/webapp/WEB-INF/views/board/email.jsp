<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<link rel="stylesheet" href="${contextPath}/assets/css/mail.css" />


<p class="emailtop">메일 문의 페이지</p>

<form method="post" action="${contextPath}/record_ok.do" enctype="multipart/form-data">
<table class="emailtable">
  <tr>
    <th>SUBJECT</th>
    <td><input type="text" name="subject" id="subject" /></td>
  </tr>
  <tr>
    <td colspan="2">
      <textarea name="content" id="content">아이디(회원이 아니시라면 이름): <br />연락처: <br />문의내용:</textarea>
    </td>
  </tr>
  <tr>
    <th>첨부파일</th>
    <td>
      <input type="file" name="file" id="file" />
    </td>
  </tr>
  
</table>
<div class="emailbottom">
  <a href="${contextPath}/">HOME</a>
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