<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/extend.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/Mycss.css">
	<script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
	<title>Course</title>

	<style>
		body {
			padding-top: 50px;
			padding-bottom: 40px;
			color: #5a5a5a;
		}
	</style>

</head>

<body>
<!--下面是顶部导航栏的代码-->

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
			<li class="active">
				<a href="course">课程中心</a>
			</li>
			<li>
				<a href="article">共享中心</a>
			</li>
			<li>
				<a href="question">问答天地</a>
			</li>
			<li>
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
	<div class="f-main clearfix">
		<!--
        作者：2457244971@qq.com
        时间：2018-07-08
        描述：一级分类
    -->
		<div class="learnhub-nav-row clearfix">
			<div class="row">
				<div class="col-md-1 col-xs-1">
				<span class="hd">领域 ：</span>
				</div>
				<div class="col-md-8 col-xs-6">
				<ul class="learnhub-nav">
					<c:choose>
						<c:when test="${curCode == 0}">
							<li class="learnhub-nav-item cur-learnhub-nav">
								<a href="javascript:void(0)" onClick="_queryPage(1,'0',undefined)">全部</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="learnhub-nav-item">
								<a href="javascript:void(0)" onClick="_queryPage(1,'0',undefined)">全部</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="field" items="${fields}">
						<c:choose>
							<c:when test="${curCode == field.id}">
								<li class="learnhub-nav-item cur-learnhub-nav">
									<a href="javascript:void(0)" onClick="_queryPage(1,'${field.id}')">${field.name}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="learnhub-nav-item">
									<a href="javascript:void(0)" onClick="_queryPage(1,'${field.id}')">${field.name}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
				</div>
				<div class="col-md-3 col-xs-7">
					<form class="form-horizontal form-inline" action="searchCourse" id="myform" method="POST">
						<div class="input-group">
							<input name="searchString" type="text" class="form-control" value="${searchString}" placeholder="Search for...">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="submit" value="submit" style="max-width: 60px;">
								Go!
							</button>
							</span>
						</div>
					</form>
				</div>
			</div>

		</div>

		<!--
        作者：2457244971@qq.com
        时间：2018-07-08
        描述：课程列表
    -->
		<div class="types-content clearfix" style="margin-bottom: 20px;">
			<c:forEach var="course" items="${courses}" varStatus="status">
				<a href="/courseDetail?courseId=${course.courseId}" target="_blank">
					<div class="course-card-container">
						<c:if test="${course.courseType == '计算机'}">
							<div class="course-card-top green-bg">
								<span>${course.courseType}</span>
							</div>
						</c:if>
						<c:if test="${course.courseType == '经济管理'}">
							<div class="course-card-top brown-bg">
								<span>${course.courseType}</span>
							</div>
						</c:if>
						<c:if test="${course.courseType == '生命科学'}">
							<div class="course-card-top purple-bg">
								<span>${course.courseType}</span>
							</div>
						</c:if>
						<c:if test="${course.courseType == '文史'}">
							<div class="course-card-top blue-bg">
								<span>${course.courseType}</span>
							</div>
						</c:if>
						<c:if test="${course.courseType == '工学'}">
							<div class="course-card-top pink-bg">
								<span>${course.courseType}</span>
							</div>
						</c:if>
						<c:if test="${course.courseType == '理学'}">
							<div class="course-card-top gray-bg">
								<span>${course.courseType}</span>
							</div>
						</c:if>
						<c:if test="${course.courseType == '其他'}">
							<div class="course-card-top yellow-bg">
								<span>${course.courseType}</span>
							</div>
						</c:if>
						<div class="course-card-content">
							<h3 class="course-card-name" title="${course.courseName}">${course.courseName}</h3>
							<p class="course-card-brief" title="${course.courseDetail}">${course.courseDetail}</p>
							<div class="course-card-bottom">
								<div class="course-card-info">
										${course.studyCount}人在学
								</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>

	<script type="text/javascript">
        function _queryPage(pageNum, curCode, sort) {
            var params = '?id=' + curCode;
            window.location.href = '/courseType'+ params;
        }
        function search() {
			document.getElementById("myform").submit();
        }
	</script>
</body>

</html>