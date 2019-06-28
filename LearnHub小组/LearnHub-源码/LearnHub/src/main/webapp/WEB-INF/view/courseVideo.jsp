<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
    <meta charset="UTF-8">
    <title>课程视频</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 40px;
            color: #5a5a5a;
        }
    </style>
    <style type="text/css">

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

<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-8">
            <h2>
                ${thisCourseSection.name}
            </h2>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8 col-md-8" style="padding-bottom: 20px;">
            <section id="player">
                <video id="media" width="100%" height="100%" controls="controls">
                    <source id="v1" src="${pageContext.request.contextPath }/style/video/${thisCourseSection.id}.mp4">
                </video>
            </section>
        </div>

        <div class="col-lg-4 col-md-4 col-xs-6">
            <!-- 章节信息 - start -->
            <div class="main-course-right"style="border-radius:20px;padding-left: 10px;">
                <h3 class="mt-30">所有章节</h3>
                <div class="video-course-fix-parent">
                    <div class="video-course-fix">
                        <c:forEach var="courseSectionList" items="${courseSectionLists}">
                            <div class="chapter" style="border: none;">
                                <a href="javascript:void(0);" class="js-open">
                                    <h3>
                                        <strong>${courseSectionList.name}</strong>
                                        <span class="drop-down">▼</span>
                                    </h3>
                                </a>
                                <ul class="chapter-sub" style="padding-left:10px;">
                                    <c:forEach var="courseSection" items="${courseSectionList.sections}">
                                        <a href="courseVideo?id=${courseSection.id}">
                                            <li class="ellipsis video-li">
                                                <i class="icon-video">▶</i>${courseSection.name}
                                            </li>
                                        </a>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>

                </div>

            </div>
            <!-- 章节信息 - end -->
        </div>
        <div class="col-lg-8 col-md-8 col-xs-6"style="background-color: #F7F7F7;border-radius:20px;padding-bottom: 10px;">
            <h3>相关文件</h3>
            <a href="/setFileId?sectionId=${thisCourseSection.id}">${thisCourseSection.name}</a>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        //实现 章节鼠标焦点 动态效果
        $('.chapter li').hover(function() {
            $(this).find('.icon-video').css('color', '#FFF');
        }, function() {
            $(this).find('.icon-video').css('color', '#777');
        });

        $('.js-open').click(function() {
            var display = $(this).parent().find('ul').css('display');
            if(display == 'none') {
                $(this).parent().find('ul').css('display', 'block');
                $(this).find('.drop-down').html('▼');
            } else {
                $(this).parent().find('ul').css('display', 'none');
                $(this).find('.drop-down').html('▲');
            }
        });
    });
</script>
</body>

</html>