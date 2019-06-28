<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/Mycss.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/reset.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
		<title>共享中心</title>
		<style>
			body {
				padding-top: 50px;
				padding-bottom: 40px;
				color: #5a5a5a;
			}

		</style>

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
					<li class="active">
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

		<!--
                作者：2457244971@qq.com
                时间：2018-07-08
                描述：一级分类
            -->
		<div class="container"style="padding-top: 15px;width: 1220px;">
			<div class="row">
				<div class="clearfix col-md-12">
					<div class="learnhub-nav-row" style="width: 1220px;">
						<div class="row">
							<div class="col-md-1 col-xs-1">
								<span class="hd">领域 ：</span>
							</div>
							<div class="col-md-6 col-xs-6">
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
							<div class="col-md-3 col-xs-6">
								<form class="form-horizontal form-inline" action="searchArticle" id="myform" method="POST">
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
							<div class="col-md-1 col-xs-6">
								<input class="btn btn-primary" value="创作中心" onclick="checkIfLogin('${loginUser.username}')" style="width: 100px;"/>
							</div>
							
						</div>

					</div>
				</div>
			</div>

		</div>

		<div class="container">
			<div class="row">
				<div class=" col-md-8 col-lg-8 text-list" style="z-index: 2;">
					<c:forEach var="article" items="${articleList}">
						<div class="media text-list-single">
						<div class="media-left">
							<div class="text-list-field">
								<span class="text-20">${article.articleType}</span>
							</div>
							<img class="media-object img-thumbnail" src="${pageContext.request.contextPath }/articleimg/${article.id}.jpg" alt="媒体对象" style="height: 100px;">

						</div>
						<div class="media-body">
							<h4 class="media-heading">
    										<p class="text-list-title" style="padding-top: 10px;">
    											<a href="/articleDetail?articleId=${article.id}">${article.title}</a>
    										</p>
    									</h4>
							<h5>
    										<p class="text-list-content">
    											<span>${article.summary}</span>
    										</p>
    								</h5>
							<div class="row">
								<div class="col-md-6 col-xs-6 col-xs-offset-1 text-list-footer">
									<img src="${pageContext.request.contextPath }/userimg/${article.userId}.jpg" class="img-circle img-responsive" alt="Cinque Terre" style="height: 40px;"> &nbsp;
									<span>${article.username}</span> &nbsp;&nbsp;
									<span>|</span>&nbsp;&nbsp;
									<span class="text-list-date"><fmt:formatDate value="${article.date}" pattern="yyyy-MM-dd" /></span>
								</div>

								<div class="text-list-footer2" style="height: 40px;">
									<div style="min-width: 58px; font-size: 14px;">
										<span style="color: blue;">${article.clickNum}</span>&nbsp;
										<span class="text-list-foor-font">
											阅读
										</span>
									</div>
									&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
									<div style="min-width: 58px; font-size: 14px;">
										<span style="color: blue;">${article.commentNum}</span>&nbsp;
										<span class="text-list-foor-font">
											评论
										</span>
									</div>
								</div>
							</div>

						</div>

					</div>
					</c:forEach>
				</div>
				<div class="col-md-3 col-lg-3">
					<div class="text-list-field">
						<span class="text-20">精品推荐</span>
					</div>


					<h5>
						您可能感兴趣的课程：
					</h5>
					<br />
					<ul class="course-suggest" style="padding-left:10px;">
						<c:forEach items="${recommendCourses}" var="recommendCourse">
							<a href="/courseDetail?courseId=${recommendCourse.courseId}">
								<li class="course-suggest-list">
									<i class="icon-video">▶</i>${recommendCourse.courseName}
								</li>
							</a>
							<br>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</body>


	<script type="text/javascript">
        function _queryPage(pageNum, curCode, sort) {
            var params = '?id=' + curCode;
            window.location.href = '/articleType'+ params;
        }
        
        function checkIfLogin(x) {
			if (x == ''){
                window.location.href = "login";
            }
            else
			{
                window.location.href = "createArticle";
			}




        }
	</script>
</html>