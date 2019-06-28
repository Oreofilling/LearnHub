<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Question</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/Mycss.css">
    <script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/editor/editormd.css">
    <script src="${pageContext.request.contextPath }/style/editor/editormd.min.js"></script>
    <script src="${pageContext.request.contextPath }/style/editor/jquery.min.js"></script>
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

<div class="container">
    <form action="/submitQuestion" method="post">
        <input name="userId" value="${loginUser.id}" hidden="hidden" />
        <input name="userName" value="${loginUser.username}" hidden="hidden" />
        <input name="date" value="2018-07-13" hidden="hidden" />
        <input name="answerNum" value="0" hidden="hidden" />
        <input name="clickNum" value="0" hidden="hidden" />
        <div class="layui-input-block" style="margin-left: 0;padding-top: 20px;">
            <input type="text" name="title" id="title" placeholder="请输入问题标题" maxlength="32" class="form-control"></input>
        </div>
        <div class="layui-input-block" style="margin-left: 0;padding-top: 20px;padding-bottom: 20px;">
            <textarea name="content" id="content" placeholder="请输入问题描述" maxlength="1000" class="form-control" style="height: 200px;resize:none;"></textarea>
        </div>

        <div class="row">
            <div class="col-md-2 col-xs-3">
                <span style="font-size: 20px;">问题分类：</span>
            </div>
            <div class="col-md-2 col-xs-3">
                <select id="selectField" name="type" class="form-control" style="width: 200px;">
                    <option value="计算机">计算机</option>
                    <option value="经济管理">经济管理</option>
                    <option value="生命科学">生命科学</option>
                    <option value="文史">文史</option>
                    <option value="工学">工学</option>
                    <option value="理学">理学</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div style="margin-top: 20px;margin-left: 10px;">
                <input class="btn btn-primary" type="submit" value="提交" name="submit" onclick="return check()" style="width: 100px;">
            </div>
        </div>

    </form>
</div>

<script type="text/javascript">
    function check() {
        var selectTitle = document.getElementById("title");
        if(selectTitle.value.length < 1) {
            alert("问题标题不能为空");
            selectTitle.focus();
            return false;
        }
        var selectSummary = document.getElementById("content");
        if(selectSummary.value.length < 1) {
            alert("问题描述不能为空");
            selectSummary.focus();
            return false;
        }
        var selectObj = document.getElementById("selectField");
        var activeIndex = selectObj.options[selectObj.selectedIndex].value;
        if(activeIndex == "") {
            alert("请选择您的问题类别！");
            selectObj.focus();
            return false;
        }
        return true;
    }
</script>
</body>

</html>
