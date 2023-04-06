<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="${pageContext.request.contextPath}/resources/css/login/login.css" rel="stylesheet" type="text/css">
    
<div class="form">
  <div class="form-toggle"></div>
  <div class="form-panel one">
    <div class="form-header">
      <h1>DUBU Login</h1>
    </div>
    <div class="form-content">
      <form action="/login" method="post">
        <div class="form-group">
          <label for="username">ID</label>
          <input type="text" name="loginId" name="username" required />
        </div>
        <div class="form-group">
          <label for="password">PASSWORD</label>
          <input type="password" id="password" name="loginPwd" required />
          <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
        </div>
        <div class="form-group">

        </div>
        <div class="form-group">
          <button type="submit">로그인</button>
        </div>
      </form>
    </div>
  </div>


</div>

