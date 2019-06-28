<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/Mycss.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/reset.css">
		<script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
		<title>question</title>
		<style type="text/css">
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
						<li>
							<a href="course">课程中心</a>
						</li>
						<li>
							<a href="article">共享中心</a>
						</li>
						<li class="active">
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
		<div class="container"style="padding-top: 15px;width: 1220px;">
			<div class="row">
				<div class="clearfix col-md-12">
					<div class="learnhub-nav-row" style="width:1220px;">
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
													<a href="javascript:void(0)" onClick="_queryPage(1,'${field.id}',undefined)">${field.name}</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="learnhub-nav-item">
													<a href="javascript:void(0)" onClick="_queryPage(1,'${field.id}',undefined)">${field.name}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
							</div>
							<div class="col-md-3 col-xs-6">
								<form class="form-horizontal form-inline" action="searchQuestion" id="myform" method="POST">
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
								<input class="btn btn-primary" value="提出问题" onclick="checkIfLogin('${loginUser.username}')" style="width: 100px;"/>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>

		<div class="container">
			<div class="row" style="padding-bottom: 10px;height: 40px;">
				<div class="col-md-1 col-xs-2 tobe-center">
					<a href="javascript:void(0)" onClick="_queryPage(1,undefined,1)">
						<c:choose>
							<c:when test="${tab == 1}">
								<div class="cur-question-sort">
									<span>最新</span>
								</div>
							</c:when>
							<c:otherwise>
								<span style="color: gray;">最新</span>
							</c:otherwise>
						</c:choose>
					</a>
				</div>
				<div class="col-md-1 col-xs-2 tobe-center" style="border-left: 1px solid black;border-right: 1px solid black;">
					<a href="javascript:void(0)" onClick="_queryPage(1,undefined,2)">
						<c:choose>
							<c:when test="${tab == 2}">
								<div class="cur-question-sort">
									<span>最热</span>
								</div>
							</c:when>
							<c:otherwise>
								<span style="color: gray;">最热</span>
							</c:otherwise>
						</c:choose>
					</a>
				</div>
				<div class="col-md-1 col-xs-2 tobe-center">
					<a href="javascript:void(0)" onClick="_queryPage(1,undefined,3)">
						<c:choose>
							<c:when test="${tab == 3}">
								<div class="cur-question-sort">
									<span>等待回答</span>
								</div>
							</c:when>
							<c:otherwise>
								<span style="color: gray;">等待回答</span>
							</c:otherwise>
						</c:choose>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8 col-lg-8 col-xs-12 answer-list">
					<c:forEach var="question" items="${questionList}">
						<div class="media answer-list-single">
							<div class="media-left">
								<div class="answer-list-field">
									<span class="text-16">${question.questionType}</span>
								</div>
								<div class="answer-list-img">
									<img class="media-object img-circle" src="${pageContext.request.contextPath }/userimg/${question.questionUserId}.jpg" alt="媒体对象" style="height: 50px;">
								</div>

								<div class="answer-list-name">
									<span class="answer-list-name-detail">${question.questionUserName}</span>
								</div>
							</div>
							<div class="media-body">
								<div class="row">
									<div class="col-lg-7 col-md-7 col-xs-12">
										<h4 class="media-heading ">
										<p class="answer-list-title">
											<a href="/questionDetail?questionId=${question.id}">${question.questionTitle}</a>
										</p>
									</h4>
										<c:choose>
											<c:when test="${tab != 3}">
												<h5>
													<p class="answer-list-content">
														<span class="answer-list-content-show">${question.answerContent}</span>
													</p>
												</h5>
												<div style="padding-top: 2px;">
													&nbsp;&nbsp;<span>—</span>&nbsp;
													<span style="color: blue;">${question.answerPraiseNum}</span> &nbsp;
													<span>人赞同此回答</span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="tobe-heightCenter" style="height: 60px;">
													<input class="btn btn-primary" value="我来回答" onclick="" style="width: 200px;"/>
												</div>
											</c:otherwise>
										</c:choose>
									</div>

									<div class="col-lg-5 col-md-5 col-xs-12" style="padding-top: 5px;">
										<div class="col-md-6 col-xs-3 answer-list-right-show" style="padding-bottom: 5px;">
											<div class="row">
												<div class="col-md-12 col-xs-8 answer-list-right-show">
													<span>
												回答数
											</span>

												</div>
												<div class="col-md-12 col-xs-4 answer-list-right-show">
													<span style="color: blue;">
												${question.questionAnswerNum}
											</span>

												</div>
											</div>

										</div>

										<div class="col-md-6 col-xs-3 answer-list-right-show" style="padding-bottom: 5px;">
											<div class="row">
												<div class="col-md-12 col-xs-8 answer-list-right-show">
													<span>
												阅读数
											</span>
												</div>
												<div class="col-md-12 col-xs-4 answer-list-right-show">
													<span style="color: blue;">
												${question.questionClickNum}
											</span>
												</div>

											</div>

										</div>
										<div class="col-md-12 col-xs-6 answer-list-footer answer-list-date" style="padding-top: 20px;">
											<span>提问时间：</span>
											<span><fmt:formatDate value="${question.questionDate}" pattern="yyyy-MM-dd" /></span>
										</div>
									</div>

								</div>

							</div>

						</div>
					</c:forEach>
				</div>
				<div class="col-md-3 col-lg-3 col-xs-12">
					<div class="answer-list-field">
						<span class="text-20">精品推荐</span>
					</div>
					<h5>
						您可能感兴趣的文章
					</h5>
					<br />
					<ul class="articl-suggest" style="padding-left:10px;">
						<!--以后加上循环语句来显示推荐文章链接-->
						<c:forEach items="${recommendArticles}" var="recommendArticle">
							<a href="/articleDetail?articleId=${recommendArticle.id}">
								<li class="article-suggest-list">
									<i class="icon-video">▶</i>${recommendArticle.title}
								</li>
							</a>
							<br>
						</c:forEach>
					</ul>
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
		<script type="text/javascript">
			function _queryPage(pageNum, code, sort) {
				var params;
				if(code == undefined){
					params = '?type=' + ${curCode};
				}
				else{
					params = '?type=' + code;
				}
				if(sort == undefined){
					params += '&tab=' + ${tab};
				}
				else{
					params += '&tab=' + sort;
				}
				
				window.location.href = '/question'+ params;
			}
            function checkIfLogin(x) {
                if (x == ''){
                    window.location.href = "login";
                }
                else
                {
                    window.location.href = "createQuestion";
                }
            }
		</script>
	</body>

</html>