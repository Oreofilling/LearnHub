<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户空间</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/Mycss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/reset.css">
    <script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
    <style>
        body {
            padding-top: 80px;
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
                <li>
                    <a href="article">共享中心</a>
                </li>
                <li>
                    <a href="question">问答天地</a>
                </li>
                <li>
                    <a href="exam">考试中心</a>
                </li>
                <li class="active">
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

<div class="container-fluid">
    <div class="row">
        <!--总的目录栏 start-->
        <div class="col-lg-offset-1 col-lg-2 col-xs-12">
            <div class="row">
                <div class="col-lg-12 col-xs-3" style="padding-top: 20px;padding-bottom: 20px;">
                    <img class="img-circle" align="absmiddle" src="${pageContext.request.contextPath }/userimg/${loginUser.id}.jpg" alt="用户头像" style="height: 80px;">
                    <span style="font-size: 20px;">${loginUser.username}</span>
                </div>
                <div id="main-left">
                    <div class="col-lg-12 col-xs-6 main-left-content">
                        <a id="care1" href="javascript:void(0)" class="main-left-actived" onclick="showContent(1)">
                            <span>关注管理</span>
                        </a>
                    </div>
                    <div class="col-lg-12 col-xs-6 main-left-content">
                        <a id="care2" href="javascript:void(0)" onclick="showContent(2)">
                            <span>关注动态</span>
                        </a>
                    </div>
                    <div class="col-lg-12 col-xs-6 main-left-content">
                        <a id="care3" href="javascript:void(0)" onclick="showContent(3)">
                            <span>文章管理</span>
                        </a>
                    </div>
                    <div class="col-lg-12 col-xs-6 main-left-content">
                        <a id="care4" href="javascript:void(0)" onclick="showContent(4)">
                            <span>账户设置</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--总的目录栏 end-->
        <div class="col-lg-8 col-xs-12" style="padding-top: 20px;">
            <!--关注管理 start-->
            <div id="careManager">
                <div class="row" style="background-color: #F7F7F7;	border-bottom: 1px solid black;">
                    <div id="main-right-manager">
                        <div class="col-md-3 col-xs-4 main-right-top tobe-center">
                            <a id="care11" href=" javascript:void(0) " class="main-right-actived " onclick="showContent(5)">
                                <span>关注课程</span>
                            </a>
                        </div>
                        <div class="col-md-3 col-xs-4 main-right-top tobe-center ">
                            <a id="care12" href="javascript:void(0)" onclick="showContent(6)">
                                <span>关注用户</span>
                            </a>
                        </div>
                        <div class="col-md-3 col-xs-4 main-right-top tobe-center">
                            <a id="care13" href=" javascript:void(0) " onclick="showContent(7)">
                                <span>关注问题</span>
                            </a>
                        </div>
                    </div>

                </div>
                <!--
                                        作者：2457244971@qq.com
                                        时间：2018-07-18
                                        描述：careCourse
                                    -->
                <div id="careCourse">
                    <c:forEach var="courseAndSection" items="${courseAndSectionList}">
                        <div class="row tobe-heightCenter main-right main-right-single-course">
                            <div class="col-md-4 col-xs-4 main-right-content">
                                    ${courseAndSection.courseName}
                            </div>
                            <div class="col-md-4 col-xs-4 main-right-content">
                                <span>上次学习:</span>
                                <br />
                                <span>${courseAndSection.sectionName}</span>
                            </div>
                            <div class="col-md-3 col-xs-3 main-right-content">
                                <input class="btn btn-primary" value="继续学习" onclick="link('/courseVideo?id=${courseAndSection.sectionId}')" style="width: 100px;" />
                            </div>
                            <div class="col-md-1 col-xs-1">
                                <a href="/deleteFocus?userId=${loginUser.id}&focusId=${courseAndSection.courseId}&type=1">
                                    <span class="glyphicon glyphicon-remove-circle btn-lg"></span>
                                </a>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <!--
                                        作者：2457244971@qq.com
                                        时间：2018-07-18
                                        描述：careMember
                                    -->
                <div id="careMember" style="display: none;">
                    <div class="row">
                        <c:forEach var="allFocusUser" items="${allFocusUserList}">
                            <div class="col-md-6 main-right-single-member">
                                <img class="img-circle" align="absmiddle" src="${pageContext.request.contextPath }/userimg/${allFocusUser.id}.jpg" alt="用户头像" style="height: 60px;">
                                <span style="font-size: 16px;">${allFocusUser.username}</span>
                                <a href="/deleteFocus?userId=${loginUser.id}&focusId=${allFocusUser.id}&type=2">
                                    <span class="glyphicon glyphicon-remove-circle btn-lg"></span>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!--
                                        作者：2457244971@qq.com
                                        时间：2018-07-18
                                        描述：careQuestion
                                    -->
                <div id="careQuestion" style="display: none;">
                    <c:forEach var="allFocusQuestion" items="${allFocusQuestionList}">
                        <div class="row">
                            <div class="col-md-11 col-xs-11">
                                <div class="media answer-list-single">
                                    <div class="media-left">
                                        <div class="answer-list-field">
                                            <span class="text-16">${allFocusQuestion.questionType}</span>
                                        </div>
                                        <div class="answer-list-img">
                                            <img class="media-object img-circle" src="${pageContext.request.contextPath }/userimg/${allFocusQuestion.questionUserId}.jpg" alt="媒体对象" style="height: 50px;">
                                        </div>

                                        <div class="answer-list-name">
                                            <span class="answer-list-name-detail">${allFocusQuestion.questionUserName}</span>
                                        </div>
                                    </div>
                                    <div class="media-body">

                                        <div class="row">
                                            <div class="col-lg-7 col-md-7 col-xs-12">
                                                <h4 class="media-heading ">
                                                    <p class="answer-list-title">
                                                        <a>${allFocusQuestion.questionTitle}</a>
                                                    </p>
                                                </h4>

                                                <h5>
                                                    <p class="answer-list-content">
                                                        <span class="answer-list-content-show">${allFocusQuestion.answerContent}</span>
                                                    </p>
                                                </h5>
                                                <div style="padding-top: 2px;">
                                                    &nbsp;&nbsp;<span>—</span>&nbsp;
                                                    <span style="color: blue;">${allFocusQuestion.answerPraiseNum}</span> &nbsp;
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
                                                                    ${allFocusQuestion.questionAnswerNum}
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
                                                                    ${allFocusQuestion.questionClickNum}
                                                            </span>
                                                        </div>

                                                    </div>

                                                </div>
                                                <div class="col-md-12 col-xs-6 answer-list-footer answer-list-date" style="padding-top: 20px;">
                                                    <span>提问时间：</span>
                                                    <span><fmt:formatDate value="${allFocusQuestion.questionDate}" pattern="yyyy-MM-dd" /></span>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 col-xs-1">
                                <a href="/deleteFocus?userId=1&focusId=1&type=3">
                                    <span class="glyphicon glyphicon-remove-circle btn-lg"></span>
                                </a>
                            </div>





                        </div>
                    </c:forEach>
                </div>
            </div>
            <!--关注管理 end-->

            <!--关注动态 start-->

            <div id="careDynamic" style="display: none;">
                <div class="row" style="background-color: #F7F7F7;	border-bottom: 1px solid black;">
                    <div id="main-right-dynamic">
                        <div class="col-md-3 col-xs-6 main-right-top tobe-center">
                            <a href=" javascript:void(0) " class="main-right-actived " onclick="showContent(8)">
                                <span>用户动态</span>
                            </a>
                        </div>
                        <div class="col-md-3 col-xs-6 main-right-top tobe-center ">
                            <a href="javascript:void(0)" onclick="showContent(9)">
                                <span>问题动态</span>
                            </a>
                        </div>
                    </div>

                </div>

                <div id="memberDynamic">
                    <c:forEach var="focusArticle" items="${focusArticleList}">
                        <div class="media text-list-single">
                            <div class="media-left">
                                <div class="text-list-field">
                                    <span class="text-20">${focusArticle.articleType}</span>
                                </div>
                                <img class="media-object img-thumbnail" src="${pageContext.request.contextPath }/articleimg/${focusArticle.id}.jpg" alt="媒体对象" style="height: 100px;">

                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <p class="text-list-title" style="padding-top: 10px;">
                                        <a href="/articleDetail?articleId=${focusArticle.id}">${focusArticle.title}</a>
                                    </p>
                                </h4>
                                <h5>
                                    <p class="text-list-content">
                                        <span>${focusArticle.summary}</span>
                                    </p>
                                </h5>
                                <div class="row">
                                    <div class="col-md-6 col-xs-6 col-xs-offset-1 text-list-footer">
                                        <img src="${pageContext.request.contextPath }/userimg/${focusArticle.userId}.jpg" class="img-circle img-responsive" alt="Cinque Terre" style="height: 40px;"> &nbsp;
                                        <span>${focusArticle.username}</span> &nbsp;&nbsp;
                                        <span>|</span>&nbsp;&nbsp;
                                        <span class="text-list-date"><fmt:formatDate value="${focusArticle.date}" pattern="yyyy-MM-dd" /></span>
                                    </div>

                                    <div class="text-list-footer2" style="height: 40px;">
                                        <div style="min-width: 58px; font-size: 14px;">
                                            <span style="color: blue;">${focusArticle.clickNum}</span>&nbsp;
                                            <span class="text-list-foor-font">
											阅读
										</span>
                                        </div>
                                        &nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
                                        <div style="min-width: 58px; font-size: 14px;">
                                            <span style="color: blue;">${focusArticle.commentNum}</span>&nbsp;
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

                <div id="questionDynamic" style="display: none;">
                    <c:forEach var="focusQuestion" items="${focusQuestionList}">
                        <div class="media answer-list-single">
                            <div class="media-left">
                                <div class="answer-list-field">
                                    <span class="text-16">${focusQuestion.questionType}</span>
                                </div>
                                <div class="answer-list-img">
                                    <img class="media-object img-circle" src="${pageContext.request.contextPath }/userimg/${focusQuestion.questionUserId}.jpg" alt="媒体对象" style="height: 50px;">
                                </div>

                                <div class="answer-list-name">
                                    <span class="answer-list-name-detail">${focusQuestion.questionUserName}</span>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="row">
                                    <div class="col-lg-7 col-md-7 col-xs-12">
                                        <h4 class="media-heading ">
                                            <p class="answer-list-title">
                                                <a>${focusQuestion.questionTitle}</a>
                                            </p>
                                        </h4>


                                        <h5>
                                            <p class="answer-list-content">
                                                <span class="answer-list-content-show">${focusQuestion.answerContent}</span>
                                            </p>
                                        </h5>
                                        <div style="padding-top: 2px;">
                                            &nbsp;&nbsp;<span>—</span>&nbsp;
                                            <span style="color: blue;">${focusQuestion.answerPraiseNum}</span> &nbsp;
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
                                                                    ${focusQuestion.questionAnswerNum}
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
                                                                    ${focusQuestion.questionClickNum}
                                                            </span>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="col-md-12 col-xs-6 answer-list-footer answer-list-date" style="padding-top: 20px;">
                                            <span>提问时间：</span>
                                            <span><fmt:formatDate value="${focusQuestion.questionDate}" pattern="yyyy-MM-dd" /></span>
                                        </div>
                                    </div>

                                </div>

                            </div>


                        </div>
                    </c:forEach>
                </div>
            </div>
            <!--关注动态 end-->

            <!--文章管理 start-->

            <div id="articleManager" style="display: none;">
                <div class="row" style="background-color: #F7F7F7;	border-bottom: 1px solid black;">
                    <div id="main-right-articleManager">
                        <div class="col-md-3 col-xs-4 main-right-top tobe-center">
                            <a id="care31" href=" javascript:void(0) " class="main-right-actived ">
                                <span>文章管理</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!--该用户发表的文章管理 start-->
                <div id="articleChange">
                    <c:forEach var="userArticle" items="${userArticleList}">
                        <div class="row">
                            <div class="col-md-11 col-xs-11">
                                <div class="media text-list-single">
                                    <div class="media-left">
                                        <div class="text-list-field">
                                            <span class="text-20">${userArticle.articleType}</span>
                                        </div>
                                        <img class="media-object img-thumbnail" src="${pageContext.request.contextPath }/articleimg/${userArticle.id}.jpg" alt="媒体对象" style="height: 100px;">

                                    </div>

                                    <div class="media-body">
                                        <h4 class="media-heading">
                                            <p class="text-list-title" style="padding-top: 10px;">
                                                <a href="/articleDetail?articleId=${userArticle.id}">${userArticle.title}</a>
                                            </p>

                                        </h4>
                                        <h5>
                                            <p class="text-list-content">
                                                <span>${userArticle.summary}</span>
                                            </p>
                                        </h5>
                                        <div class="row">
                                            <div class="col-md-6 col-xs-6 col-xs-offset-1 text-list-footer">
                                                <span class="text-list-date"><fmt:formatDate value="${userArticle.date}" pattern="yyyy-MM-dd" /></span>
                                            </div>

                                            <div class="text-list-footer2" style="height: 40px;">
                                                <div style="min-width: 58px; font-size: 14px;">
                                                    <span style="color: blue;">${userArticle.clickNum}</span>&nbsp;
                                                    <span class="text-list-foor-font">
											阅读
										</span>
                                                </div>
                                                &nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;
                                                <div style="min-width: 58px; font-size: 14px;">
                                                    <span style="color: blue;">${userArticle.commentNum}</span>&nbsp;
                                                    <span class="text-list-foor-font">
											评论
										</span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 col-xs-1">
                                <a href="/deleteArticle?userId=${loginUser.id}&articleId=${userArticle.id}">
                                    <span class="glyphicon glyphicon-remove-circle btn-lg"></span>
                                </a>
                            </div>
                        </div>




                    </c:forEach>
                </div>

                <!--该用户发表的文章管理 end-->
            </div>
            <!--文章管理 end-->

            <!--账户设置 start-->

            <div id="account" style="display: none;">
                <div class="row" style="background-color: #F7F7F7;	border-bottom: 1px solid black;">
                    <div id="main-right-account">
                        <div class="col-md-3 col-xs-6 main-right-top tobe-center">
                            <a id="account1" href=" javascript:void(0) " class="main-right-actived " onclick="showContent(10)">
                                <span>密码修改</span>
                            </a>
                        </div>
                        <div class="col-md-3 col-xs-6 main-right-top tobe-center ">
                            <a id="account2" href="javascript:void(0)" onclick="showContent(11)">
                                <span>头像上传</span>
                            </a>
                        </div>
                    </div>

                </div>
                <!--密码修改 start-->
                <div id="changePassword">

                    <form class="form-horizontal" name="changeForm" action="changePassword" role="form" method="post"style="padding-top: 55px;">
                        <input name="userId" value="${loginUser.id}" hidden="hidden" />
                        <div class="form-group">
                            <div class="col-md-6 col-xs-8">
                                <input type="text" class="form-control" name="oldPassword" id="user" placeholder="请输入原密码" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-xs-8">
                                <input type="password" class="form-control" name="newPassword" id="pw" placeholder="请输入新密码，密码长度最小为6，最大16" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-xs-8">
                                <input type="password" class="form-control" name="repw" id="repw" placeholder="请再次输入新密码" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-xs-8">
                                <button class="btn btn-primary" type="submit" onclick="return resure()" style="width:150px;height:40px">确    认</button>
                            </div>
                        </div>
                        <p class="tip"><span style="color: red;">${message}</span></p>
                    </form>
                </div>
                <!--密码修改 end-->

                <!--上传头像 start-->
                <div id="setPortrait" style="display: none;">
                    <div class="row" style="padding-top: 20px;">
                        <div class="col-md-6 col-xs-6">
                            <img class="img-circle" align="absmiddle" src="${pageContext.request.contextPath }/userimg/${loginUser.id}.jpg" alt="用户头像" style="height: 150px;">
                        </div>
                        <div class="col-md-6 col-xs-6">
                            <form action="uploadPic" method="POST" enctype="multipart/form-data" style="padding-top: 50px;">
                                <input  type="file" name="pic" />
                                <input name="userId" value="${loginUser.id}" hidden="hidden" />
                                <div style="padding-top: 10px;">
                                    <button class="btn-primary btn" type="submit" value="submit">submit</button>
                                </div>

                            </form>
                        </div>
                    </div>

                </div>
                <!--上传头像 end-->
            </div>
            <!--账户设置 end-->
        </div>
    </div>
</div>

<script type="text/javascript ">

    window.onload = function(){
        var a = ${tab};
        switch(a) {
            case 1:
                showContent(1);
                showContent(5);
                break;
            case 2:
                showContent(1);
                showContent(6);
                $('#care12').addClass("main-right-actived");
                $('#care11').removeClass("main-right-actived");
                break;
            case 3:
                showContent(1);
                showContent(7);
                $('#care13').addClass("main-right-actived");
                $('#care11').removeClass("main-right-actived");
                break;
            case 4:
                showContent(3);
                $('#care3').addClass("main-left-actived");
                $('#care1').removeClass("main-left-actived");
                break;
            case 5:
                showContent(4);
                showContent(10);
                $('#care3').addClass("main-left-actived");
                $('#care1').removeClass("main-left-actived");
                break;
            default:
                showContent(1);
                showContent(5);
                $('#care12').addClass("main-right-actived");
                $('#care13').addClass("main-right-noactived");
        }
    }

    function resure() {
        var pwd = document.getElementById("pw").value;
        var repwd = document.getElementById("repw").value;
        if(pwd != repwd) {
            window.alert("您输入的新密码与确认密码确认不一致");
            return false;
        } else
            return true;
    }

    function showContent(n) {
        switch(n) {
            case 1:
                $('#careManager').show();
                $('#careDynamic').hide();
                $('#articleManager').hide();
                $('#account').hide();
                break;
            case 2:
                $('#careManager').hide();
                $('#careDynamic').show();
                $('#articleManager').hide();
                $('#account').hide();
                break;
            case 3:
                $('#careManager').hide();
                $('#careDynamic').hide();
                $('#articleManager').show();
                $('#account').hide();
                break;
            case 4:
                $('#careManager').hide();
                $('#careDynamic').hide();
                $('#articleManager').hide();
                $('#account').show();
                break;
            case 5:
                $('#careCourse').show();
                $('#careMember').hide();
                $('#careQuestion').hide();
                break;
            case 6:
                $('#careCourse').hide();
                $('#careMember').show();
                $('#careQuestion').hide();
                break;
            case 7:
                $('#careCourse').hide();
                $('#careMember').hide();
                $('#careQuestion').show();
                break;
            case 8:
                $('#memberDynamic').show();
                $('#questionDynamic').hide();
                break;
            case 9:
                $('#memberDynamic').hide();
                $('#questionDynamic').show();
                break;
            case 10:
                $('#changePassword').show();
                $('#setPortrait').hide();
                break;
            case 11:
                $('#changePassword').hide();
                $('#setPortrait').show();
                break;
        }
    }
    $('#main-left a').click(function() {
        var f = this;
        $('#main-left a').each(function() {
            this.className = this == f ? 'main-left-actived' : 'main-left-noactived'
        });
    });
    $('#main-right-manager a').click(function() {
        var f = this;
        $('#main-right-manager a').each(function() {
            this.className = this == f ? 'main-right-actived' : 'main-right-noactived'
        });
    });
    $('#main-right-dynamic a').click(function() {
        var f = this;
        $('#main-right-dynamic a').each(function() {
            this.className = this == f ? 'main-right-actived' : 'main-right-noactived'
        });
    });
    $('#main-right-account a').click(function() {
        var f = this;
        $('#main-right-account a').each(function() {
            this.className = this == f ? 'main-right-actived' : 'main-right-noactived'
        });
    });


    function link(a) {
        window.location.href = a;
    }
</script>
</body>

</html>