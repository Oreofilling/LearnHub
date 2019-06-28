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
    <title>考试中心</title>
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

<!--
        作者：2457244971@qq.com
        时间：2018-07-08
        描述：一级分类
   -->

<div class="container">
    <div class="row">
        <div class=" col-md-8 col-lg-8 text-list">
            <c:forEach var="exam" items="${examList}">
                <h3>
                    <p style="padding-top: 10px; padding-bottom: 10px;">
                        <a href="/examDetail?examId=${exam.id}">${exam.title}</a>
                    </p>
                </h3>

            </c:forEach>
        </div>
        <div class="col-md-3 col-lg-3">
            <div class="text-list-field">
                <span class="text-20">其他功能</span>
            </div>
        </div>
    </div>
</div>
</body>


</html>