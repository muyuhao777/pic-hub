<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <%@ taglib prefix="c" uri="https://jakarta.ee/xml/ns/jakartaee/jstl/core"%>
  <title>login</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
  <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
  <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery/jquery-ui.min.css"> <!-- 此处根据你自己的路径进行设置 -->
  <script src="${pageContext.request.contextPath}/jquery/jquery-3.6.4.min.js"></script> <!-- 此处根据你自己的路径进行设置 -->
  <script src="${pageContext.request.contextPath}/jquery/jquery-ui.min.js"></script> <!-- 此处根据你自己的路径进行设置 -->


<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchlayout.css">--%>
</head>
<body style="background-image: url(${pageContext.request.contextPath}/images/333.jpg)">
<script src="${pageContext.request.contextPath}/dtree/dtree.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>

  <div style="width: 100%;height: 50px;">
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Project</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="../../../../webapp/search.jsp">Search
              <span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>
            <li><a href="../../../../webapp/demo.jsp">Picture
              <span class="glyphicon glyphicon-picture" aria-hidden="true"></span></a></li>
            <li class="active"><a href="login.jsp">Login
              <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></a></li>
            <li><a href="../../../../webapp/index.html">Home
              <span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
          </ul>

        </div>
      </div>
    </nav>
  </div>
  <script src="${pageContext.request.contextPath}/js/index.js"></script>
  <div class="container right-panel-active">
    <div class="container_from container--signin">
      <form action="http://localhost:8001/login" method="post" id="post_form" class="form-signin">
        <h2 class="from_title">Sign In</h2>
        <input name='u_id'  placeholder="Account" class="input" id="inun" onblur="formValiad.checkInUserEmail()"/> <span class="imsg" id="inUserName">Please Input Account</span>
        <input name='u_pwd'  placeholder="Password" class="input" id="inupwd" onblur="formValiad.checkUserInPassword()"/> <span class="imsg" id="inUserPwd">Please Input Password</span>
        <button class="btn">Sign In</button>
      </form>
    </div>
  </div>
<%--  <div class="lanmu">--%>
<%--    <form action="http://localhost:8080/art_picture_war/login" method="post" id="post_form" class="form-signin">--%>
<%--      <h2 class="form-signin-heading">Please sign in</h2>--%>
<%--      <label for="inputEmail" class="sr-only">user id</label>--%>
<%--      <input  type="text" name='u_id' value="1"  id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">--%>
<%--      <label for="inputPassword" class="sr-only">Password</label>--%>
<%--      <br>--%>
<%--      <input type="password" name='u_pwd' value="123" id="inputPassword" class="form-control" placeholder="Password" required="">--%>
<%--      <br>--%>
<%--      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>--%>
<%--    </form>--%>
<%--  </div>--%>




</body>
</html>
