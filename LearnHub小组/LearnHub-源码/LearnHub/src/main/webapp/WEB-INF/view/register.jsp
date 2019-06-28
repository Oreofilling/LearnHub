<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<title>注册</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/extend.css">
<script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
	<script>
        //验证只能是字母和数字
        function checkZmOrNum(zmnum){
            var zmnumReg=/^[0-9a-zA-Z]*$/;
            if(zmnum!=""&&!zmnumReg.test(zmnum)){
                alert("用户名只能包含字母和数字,请重新输入");
                return false;
            }
            else
                return true;
        }
        //密码长度限制
        function valiPw(pwd){

            if (pwd.length > 16 || pwd.length < 6){

                alert("密码长度应该在 6 - 16 位");

                return false;
            }
            else
                return true;
        }
        //确认密码
        function resure(){
            var pwd = document.getElementById("pw").value;
            var repwd = document.getElementById("repw").value;
            if(pwd!=repwd){
                window.alert("您输入的新密码与确认密码确认不一致");

                return false;

            }
            else
                return true;

        }
        function valimail(obj){
            //对电子邮件的验证
            var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(!myreg.test(obj))
            {
                alert('请输入有效的邮箱！');
                return false;
            }
            else
                return true;
        }
        function regmanager(){

            if(!checkZmOrNum(document.getElementById("user").value)||!valimail(document.getElementById("email").value)||!valiPw(document.getElementById("pw").value)||!resure())
            {
                //alert("注册信息输入一项或多项不符合要求：");
                /**checkZmOrNum(document.getElementById("user").value);
                 valimail(document.getElementById("email").value);
                 valiPw(document.getElementById("pw").value);
                 resure();**/
                return false;
            }
            else
                return true;
        }
	</script>

</head>
<body>
<div class="container">
	<h1 class="page-header"><span class="glyphicon glyphicon-bell"></span>用户注册</h1>
	<form class="form-horizontal" name="registForm" action="${pageContext.request.contextPath}/getRegister" role="form" method="post">
		<div class="form-group">
			<div class="col-md-5">
				<input type="text" class="form-control" name="username" id="user" placeholder="请输入用户名，用户名只包含英文字母和数字"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-5">
				<input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-5">
				<input type="password" class="form-control" name="password" id="pw" placeholder="请输入密码，密码长度最小为6，最大16"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-5">
				<input type="password" class="form-control" name="repw" id="repw" placeholder="请再次输入密码"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-5">
				<button class="btn btn-primary" type="submit" onclick="return regmanager()" style="width:150px;height:40px">注   册</button>
			</div>
		</div>
		<p class="tip"><span style="color: red;">${message}</span></p>
	</form>
</div>
</body>
</html>