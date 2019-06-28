<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>exam</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
	</head>

	<body>
	<nav class="nav navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="#" class="navbar-brand">
					<img src="${pageContext.request.contextPath }/style/img/logo.png" style="height: 50px;margin-top:-15px;" />
				</a>
				<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<!--当浏览器缩小的时候，下面这些元素会消失，变成一个可弹出子菜单的小按钮-->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li>
						<a href="homePage">首页</a>
					</li>
					<li>
						<a href="course">课程中心</a>
					</li>
					<li>
						<a href="article">共享中心</a>
					</li>
					<li>
						<a href="question">问答天地</a>
					</li>
					<li class="active">
						<a href="exam">考试中心</a>
					</li>
					<li>
						<a href="mySpace">用户空间</a>
					</li>
				</ul>
				<c:if test="${loginUser == null}">
					<div class="navbar-form navbar-right">
						<a href="login" class="navbar-link">登 录</a>
						<span>|</span>
						<a href="register" class="navbar-link">注 册</a>
					</div>
				</c:if>

				<c:if test="${loginUser != null}">
					<div class="navbar-form navbar-right">
							${loginUser.username}&nbsp;&nbsp;<img class="img-circle" align="absmiddle"
																  src="${pageContext.request.contextPath }/userimg/${loginUser.id}.jpg" alt="用户头像" style="height: 35px;">
						<a href="user/logout" class="navbar-link">注 销</a>
					</div>
				</c:if>
			</div>
		</div>
	</nav>
		<div class="container">
			<div class="row" style="padding-left: 45px; padding-bottom: 20px; font-size: 20px;">
				<span>${exam.title}</span>
			</div>
			<div class="row" style="padding-left: 20px;">
				<blockquote style="font-size: 14px;">
					<span>每道题的分数：5分</span>
					<br />
					总分为：<span id="totalScore">0</span> 分
				</blockquote>
			</div>
			<form id="examForm" name="examForm" method="post" action="" onsubmit="return CheckForm()"style="background-color: #F7F7F7;border-radius:20px;">
				<c:forEach var="examQuestion" items="${examQuestionList}" >
					<div class="row" style="padding-left: 30px;padding-top: 30px;padding-right: 30px;">
					<div class="col-md-12 col-xs-12">
						<span style="font-size: 16px;">${examQuestion.title}</span>
					</div>
					<div class="col-md-6 col-xs-12">
						<label>
							<input type="radio" name="${examQuestion.id}" value="单选" id="rg1_value1" />
						A: ${examQuestion.optionA}</label>
					</div>
					<div class="col-md-6 col-xs-12">
						<label>
							<input type="radio" name="${examQuestion.id}" value="单选" id="rg1_value2"/>
						B: ${examQuestion.optionB}</label>
					</div>
				</div>
					<div class="row" style="padding-left: 30px;padding-right: 30px;">
						<div class="col-md-6 col-xs-12">
							<label>
							<input type="radio" name="${examQuestion.id}" value="单选" id="rg1_value3"/>
						C: ${examQuestion.optionC}</label>
						</div>
						<div class="col-md-6 col-xs-12">
							<label>
							<input type="radio" name="${examQuestion.id}" value="单选" id="rg1_value4"/>
						D: ${examQuestion.optionD}</label>
						</div>
					</div>
				</c:forEach>
				<div style="padding-bottom: 10px;padding-left: 30px;padding-top: 30px;">
					<input name="ok" type="submit" value="提交" class="btn btn-primary" onclick='showResult()' />
				</div>

			</form>

		</div>

		<script type="text/javascript">
			var b;
            window.onload = function(){
                var totalScore = document.getElementById ("totalScore");
                b = 5*${examQuestionList.size()};
                totalScore.innerHTML = b;
            }

			function showResult() {
				var result = 0;
				var perScore = 5;
				var userAnswer = [];
				var trueAnswer = [];
				<c:forEach var="correctAnswer" items="${correctAnswerList}">
					trueAnswer.push(${correctAnswer});
				</c:forEach>


				function getUserAnswer(radioGroupName) {
					var rg = document.getElementsByName(radioGroupName);
					for(var i = 0; i < rg.length; i++) {
						if(rg[i].checked == true){
							i = i + 1;
							userAnswer.push(i);
						}	
					}
				}
                <c:forEach var="examQuestion" items="${examQuestionList}">
					getUserAnswer(${examQuestion.id});
                </c:forEach>

				if(userAnswer) {
					for(var i = 0; i < userAnswer.length; i++) {
						if(userAnswer[i] == trueAnswer[i])
							result += perScore;
					}
				}
				if (result == b){
				    alert("\tcongratulation!\n\t您获得了满分")
                }else{
                    alert("您的分数为 ：" + result);
                }

			}
		</script>
	<script>
        function CheckForm(){
            return false;
        }
	</script>
	</body>

</html>