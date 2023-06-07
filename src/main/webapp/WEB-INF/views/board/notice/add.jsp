<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/inc/top.jsp" />

<style>

.noticetop {
  width: 150px;
  border-bottom: 1px solid black;
  font-size: 40px;
  padding-bottom: 5px;
  margin: 50px auto 50px auto;
}
.noticetop h1 {
  font-size: 40px;
  font-weight: 600;
}

.noticemain input {
  border: none;
}
.noticemain .noticetable {
  border: 1px solid #c5c5c5;
  width: 1200px;
}
.noticemain .noticetable tr {
  text-align: left;
  text-indent: 10px;
  line-height: 3;
  font-size: 13px;
}
.noticemain .noticetable tr th {
  width: 80px;
}
.noticemain .noticetable tr:nth-child(5) input {
  width: 300px;
  border: 1px solid #d5d5d5;
  background-color: white;
}
.noticemain .noticetable select,
.noticemain .noticetable option {
  background-color: white;
}
.ck.ck-editor__editable_inline>:last-child {
  max-height: 600px;
  min-height: 600px;
  background-color: white;
}
.ck-rounded-corners .ck.ck-editor__main>.ck-editor__editable, .ck.ck-editor__main>.ck-editor__editable.ck-rounded-corners {
    max-height: 600px;
}
.noticebottom {
  display: flex;
  justify-content: space-between;
  margin: 30px 0 100px 0;
}
.noticebottom a {
  text-decoration: none;
  display: block;
  font-size: 13px;
  color: white;
  width: 140px;
  height: 35px;
  padding-top: 10px;
  background-color: #d5d5d5;
  transition: all 0.5s;
}
.noticebottom a:hover {
  background-color: #c5c5c5;
  color: black;
  border: 1px solid #c5c5c5;
}
.noticebottom button {
  cursor: pointer;
  width: 140px;
  background-color: black;
  color: white;
  border: 1px solid black;
  transition: all 0.5s;
}
.noticebottom button:hover {
  background-color: #f7f7f7;
  color: black;
  border: 1px solid #f7f7f7;
}
</style>

<div class="noticetop">
  <h1>NOTICE</h1>
</div> 

<div class="noticemain">
  <form method="post" action="${contextPath}/notice/add_ok.do" enctype="multipart/form-data">
    <input type="hidden" name="category" id="category" value="N" />
    <input type="hidden" name="reg_date" id="reg_date" value="" />
    <input type="hidden" name="members_id" id="members_id" value="${login_info.getId()}" />
  <table class="noticetable">
    <tr>
      <th>SUBJECT</th>
      <td><input type="text" name="subject" id="subject" /></td>
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
  </table>
  </div>

  <div class="noticebottom">
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