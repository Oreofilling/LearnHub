<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta content="text/html; charset=UTF-8">
	<style type="text/css">
		.content-width {MARGIN: auto;WIDTH: 700px;}
		.content-width img{MAX-WIDTH: 100%!important;HEIGHT: auto!important;width: expression(this.width > 700 ? "700px" : this.width)!important;}
	</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/extend.css">
	<script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/lib/marked.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/lib/prettify.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/lib/raphael.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/lib/underscore.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/lib/sequence-diagram.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/lib/flowchart.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/lib/jquery.flowchart.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/editormd.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/Mycss.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/style/editor/editormd.css">
	<script src="${pageContext.request.contextPath }/style/editor/editormd.min.js"></script>
	<script src="${pageContext.request.contextPath }/style/editor/jquery.min.js"></script>
	<title>首页</title>

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
					<li class="active">
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
    	
		<div id="myCarousel" class="carousel slide">
		    <!-- 轮播（Carousel）指标 -->
		    <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>   
		    <!-- 轮播（Carousel）项目 -->
		    <div class="carousel-inner">

		        <div class="item active">
		            <img src="${pageContext.request.contextPath }/style/img/study (2).jpg" style="height: 620px; width: 1550px;" alt="First slide">
		            <div class="carousel-caption">
		            	<h1>
		            		知识
		            	</h1>
		            	<blockquote>
		            	<p>
		            		在知识的海洋里，<br />
		            		谁都不是淡水鱼。<br />
		            		来LearnHub，<br/>
		            		get到属于自己的学习新姿势！
		            	</p>
		            	</blockquote>
		            </div>
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath }/style/img/discuss (2).jpg" style="height: 620px; width: 1550px;" alt="Second slide">
		            <div class="carousel-caption">
		            	<h1>
		            		观点
		            	</h1>
		            	<blockquote>
		            	<p>
		            		我相信热烈的争辩，<br />
		            		我不信无声的和谐。<br />
		            		来LearnHub，<br />
		            		秀出你的观点！
		            	</p>
		            	</blockquote>
		            </div>
		        </div>
				<div class="item ">
					<img src="${pageContext.request.contextPath }/style/img/worldCup (2).jpg"  style="height: 620px; width: 1550px;" alt="Third slide">
					<div class="carousel-caption">
						<h1>
							世界杯
						</h1>
						<blockquote>
							<p>
								<b>俄罗斯世界杯</b>悄然结束,<br />
								不知不觉间，又是四年<br />
								是狂欢？或是遗憾？<br />
								是感伤？抑或奋然？<br />
								来LearnHub，分享你的那些足球之夜！
							</p>
						</blockquote>
					</div>
				</div>
		    </div>
		    <!-- 轮播（Carousel）导航 -->
		    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		    </a>
		</div>
		<br />
		<br />
		<hr />


		<h2 style="text-align: center;color: #2AABD2;">精品课程</h2>
		<br />
		<div class="types-content clearfix" style="margin-bottom: 20px;">
		<!--从后台要一张表，只显示五个人数最多的课程
		-->
			<div class="container">
			<div class="row">
				<div class="col-md-12 col-md-offset-1">
			<c:forEach var="recommendCourse" items="${recommendCourses}" varStatus="status">
				<a href="/courseDetail?courseId=${recommendCourse.courseId}" target="_blank">
					<div class="course-card-container">
						<c:if test="${recommendCourse.courseType == '计算机'}">
							<div class="course-card-top green-bg">
								<span>${recommendCourse.courseType}</span>
							</div>
						</c:if>
						<c:if test="${recommendCourse.courseType == '经济管理'}">
							<div class="course-card-top brown-bg">
								<span>${recommendCourse.courseType}</span>
							</div>
						</c:if>
						<c:if test="${recommendCourse.courseType == '生命科学'}">
							<div class="course-card-top purple-bg">
								<span>${recommendCourse.courseType}</span>
							</div>
						</c:if>
						<c:if test="${recommendCourse.courseType == '文史'}">
							<div class="course-card-top blue-bg">
								<span>${recommendCourse.courseType}</span>
							</div>
						</c:if>
						<c:if test="${recommendCourse.courseType == '工学'}">
							<div class="course-card-top pink-bg">
								<span>${recommendCourse.courseType}</span>
							</div>
						</c:if>
						<c:if test="${recommendCourse.courseType == '理学'}">
							<div class="course-card-top gray-bg">
								<span>${recommendCourse.courseType}</span>
							</div>
						</c:if>
						<c:if test="${recommendCourse.courseType == '其他'}">
							<div class="course-card-top yellow-bg">
								<span>${recommendCourse.courseType}</span>
							</div>
						</c:if>
						<div class="course-card-content">
							<h3 class="course-card-name" title="${recommendCourse.courseName}">${recommendCourse.courseName}</h3>
							<p class="course-card-brief" title="${recommendCourse.courseDetail}">${recommendCourse.courseDetail}</p>
							<div class="course-card-bottom">
								<div class="course-card-info">
										${recommendCourse.studyCount}人在学
								</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
				</div>
			</div>
			</div>
		</div>


		<hr />
		<br />
		<br />
		
		<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2 style="color: #2AABD2; text-align: center;">知无不言</h2>
				<br />
				<c:forEach var="homeArticle" items="${recommendArticles}">
				<!--
                	从后台要一张表，包含五个阅读量最高的文章
                -->
					<div class="media text-list-single">
						<div class="media-left">
							<div class="text-list-field">
								<span class="text-20">${homeArticle.articleType}</span>
							</div>
							<img class="media-object img-thumbnail" src="${pageContext.request.contextPath }/articleimg/${homeArticle.id}.jpg" alt="媒体对象" style="height: 100px;">

						</div>
						<div class="media-body">
							<h4 class="media-heading">
    										<p class="text-list-title" style="padding-top: 10px;">
    											<a href="/articleDetail?articleId=${homeArticle.id}">${homeArticle.title}</a>
    										</p>
    									</h4>
							<h5>
    										<p class="text-list-content">
    											<span>${homeArticle.summary}</span>
    										</p>
    								</h5>
							<div class="row">
								<div class="col-md-6 col-xs-6 col-xs-offset-1 text-list-footer">
									<img src="${pageContext.request.contextPath }/userimg/${homeArticle.userId}.jpg" class="img-circle img-responsive" alt="Cinque Terre" style="height: 40px;"> &nbsp;
									<span>${homeArticle.username}</span> &nbsp;&nbsp;
									<span>|</span>&nbsp;&nbsp;
									<span class="text-list-date"><fmt:formatDate value="${homeArticle.date}" pattern="yyyy-MM-dd" /></span>
								</div>

								<div class="text-list-footer2" style="height: 40px;">
									<div style="min-width: 58px; font-size: 14px;">
										<span style="color: blue;">${homeArticle.clickNum}</span>&nbsp;
										<span class="text-list-foor-font">
											阅读
										</span>
									</div>
									&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
									<div style="min-width: 58px; font-size: 14px;">
										<span style="color: blue;">${homeArticle.commentNum}</span>&nbsp;
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
			<div class="col-md-6">
				<h2 style="color: #2AABD2; text-align: center;">观点聚焦</h2>
				<br />
				<c:forEach var="question" items="${recommendQuestions}">
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
											<a>${question.questionTitle}</a>
										</p>
										</h4>
										
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
											<span></span>
											<span><fmt:formatDate value="${question.questionDate}" pattern="yyyy-MM-dd" /></span>
										</div>
									</div>

								</div>

							</div>

						</div>
					</c:forEach>
				
			</div>
		</div>
		</div>
    </body>
</html>
