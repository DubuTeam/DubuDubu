<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link href="${pageContext.request.contextPath}/resources/css/login/login.css" rel="stylesheet" type="text/css">
    
<div class="form">
  <div class="form-toggle"></div>
  <div class="form-panel one">
    <div class="form-header">
       <h2><c:out value="${error}"/></h2>
        <h2><c:out value="${logout}"/></h2>
      <h1>DUBU Login</h1>
    </div>
    <div class="form-content">
      <form action="/login" method="POST">
        <div class="form-group">
          <label for="username">ID</label>
          <input type="text" id="username" name="username" required />
        </div>
        <div class="form-group">
          <label for="password">PASSWORD</label>
          <input type="password" id="password" name="password" required />
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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

