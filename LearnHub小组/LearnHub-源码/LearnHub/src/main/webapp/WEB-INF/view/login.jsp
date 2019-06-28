<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<title>登录</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/extend.css">
<script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>

</head>

<script>
    function isnull(){
        if (document.getElementById("loguser").value==""){
            alert("用户名不能为空");
            return false;
        }
        if(document.getElementById("logpw").value==""){
            alert("密码不能为空");
            return false;
        }
    }
</script>
<body>
<div class="container">
	<h1 class="page-header">用户登录</h1>
	<form class="form-horizontal" name="loginform" action="getLogin" method="post">
		<div class="form-group">
			<div class="col-md-5">
				<input type="text" class="form-control" name="username" id="loguser" placeholder="请输入用户名"/>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-5">
				<input type="password" class="form-control" name="password" id="logpw" placeholder="请输入密码"/>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-5">
				<button class="btn btn-primary" type="submit" onclick="return isnull()" style="width:150px;height:40px">登   录</button>
			</div>
		</div>
		<p class="tip"><span style="color: red;">${message}</span></p>
	</form>
</div>
</body>
</html>