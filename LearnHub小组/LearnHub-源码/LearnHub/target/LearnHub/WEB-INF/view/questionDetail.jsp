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
    <title>QuestionDetail</title>

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
<br>
<br>
<img src="${pageContext.request.contextPath }/style/img/question.jpg" style="height: 180px;width:1550px;" />
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="content-width">
                <h4>
                    ${question.title}
                </h4>
                <p>
                    <em>${question.content}</em>
                </p>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a  data-toggle="collapse" data-parent="#accordion" href="#question${question.id}">
                                <p style="text-align: center;" >添加回答</p>
                            </a>
                        </div>
                    </div>
                    <div class="panel-collapse collapse" id="question${question.id}">

                        <form action="/submitAnswer" method="post">
                            <input name="userId" value="${loginUser.id}" hidden="hidden"/>
                            <input name="userName" value="${loginUser.username}" hidden="hidden"/>
                            <input name="date" value="2018-07-13" hidden="hidden"/>
                            <input name="praiseNum" value="0" hidden="hidden"/>
                            <input name="commentNum" value="0" hidden="hidden"/>
                            <input name="questionId" value="${question.id}" hidden="hidden">

                            <div class="editormd" id="test-editormd">
                                <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="content"></textarea>

                                <textarea class="editormd-html-textarea" name="content" id="htmlContent"></textarea>
                            </div>
                            <div style="margin-top: 20px;margin-left: 10px;">
                                <input class="btn btn-primary" type="submit" value="提交" name="submit"  style="width: 100px;">
                            </div>
                        </form>

                    </div>
                </div>
                <hr>
                <c:forEach items="${answerList}" var="answer">
                    <c:if test="${answer.questionId eq question.id}">
                        <!--回答区begin-->
                        <h2 style="color:black;">${answer.userName}</h2>
                        <p style="color: #D3D3D3;">
                            发表于：<span class="text-list-date"><fmt:formatDate value="${answer.date}" pattern="yyyy-MM-dd" /></span>
                        </p>
                        <p>${answer.content}</p>
                        <br>
                        <br>
                        <p style="color: #D3D3D3;">
                            版权所属：LearnHub智能学习平台
                            <br />
                            转载请联系作者并标注出处
                        </p>
                        <form action="/praise" method="post">
                            <input name="userId" value="${loginUser.id}" hidden="hidden"/>
                            <input name="praiseId" value="${answer.id}" hidden="hidden"/>
                            <input name="type" value="2" hidden="hidden"/>
                            <!--
                                作者：gzhlinking@foxmail.com
                                时间：2018-07-19
                                描述：遍历所有userPraise对象，若存在userPraise.id与answer.id相等且type为2，说明用户已点赞，否则未点赞
                            -->
                            <c:forEach items="${userPraiseList}" var="userPraise">
                                <c:choose>
                                    <c:when test="${userPraise.praiseId eq answer.id && userPraise.type eq 2}">
                                        <button class="btn btn-large btn-block" type="button" disabled="disabled" >已点赞(${answer.praiseNum})</button>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                            <c:forEach items="${noPraiseAnswerList}" var="noPraiseAnswer">
                                <c:choose>
                                    <c:when test="${noPraiseAnswer.id eq answer.id }">
                                        <button class="btn btn-large btn-block" type="submit" >点赞(${answer.praiseNum})</button>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </form>
                        <br>
                        <!--回答区end-->
                        <!--评论区begin-->
                        <div >
                            <div id="commentList" class="panel panel-default" style="margin-bottom:0px;">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#answer${answer.id}">
                                            <u>评论(${answer.commentNum})</u>
                                        </a>
                                    </h4>
                                </div>
                                <div id="answer${answer.id}" class="panel-collapse collapse  ">
                                    <form action="/addAnswerComment" method="post">
                                        <input name="userId" value="${loginUser.id}" hidden="hidden"/>
                                        <input name="userName" value="${loginUser.username}" hidden="hidden"/>
                                        <input name="date" value="" hidden="hidden"/>
                                        <input name="commentType" value="3" hidden="hidden"/>
                                        <input name="commentRefId" value="${answer.id}" hidden="hidden"/>
                                        <input name="replyNum" value="0" hidden="hidden"/>
                                        <input name="praiseNum" value="0" hidden="hidden"/>
                                        <div class="row">
                                            <div class="col-md-10" style="padding-left: 30px;" id="commentBox${answer.id}">
                                                <textarea name="commentContent" id="commenttxt${answer.id}" class="form-control" value="" placeholder="对这个回答你怎么看..." style="height: 40px; resize:none;"></textarea>
                                            </div>
                                            <div class="col-md-2">
                                                <button id="commentBtn" type="submit" class="btn btn-primary" style="height: 40px;" >评论</button>
                                            </div>
                                        </div>


                                    </form>
                                    <c:forEach items="${commentList}" var="comment">
                                        <!-- 每次遍历出来的评论下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                                        <c:if test="${comment.commentRefId eq answer.id}">

                                            <div class="panel-body">
                                                <span style="color: blue;">${comment.userName}</span>:&nbsp;${comment.commentContent}
                                                <br><br>
                                                <span class="text-list-date"><fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd" /></span>

                                                <p>
                                                    <a  onclick="btnReplyClick('${comment.commentRefId}','${comment.userName}')"  href="#commentBox${answer.id}">回复</a>
                                                </p>
                                            </div>

                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!--评论区end-->
                        <hr/>
                    </c:if>

                </c:forEach>
            </div>
        </div>

        <div class="col-md-4">
            <br>
            <blockquote>
                <p>
                    回答数：<b style="color:#2AABD2;">${question.answerNum}</b>
                    <br />
                    被浏览：<b style="color: #2AABD2;">${question.clickNum}</b>
                </p> <small>类别:  <cite>${question.type}</cite></small>
                <form action="/follow" method="post">
                <input name="userId" value="${loginUser.id}" hidden="hidden" />
                <input name="focusId" value="${question.id}" hidden="hidden" />
                <input name="type" value="3" hidden="hidden" />
                <c:choose>
                    <c:when test="${ userFocus.focusId eq question.id && userFocus.type eq 3}">
                        <button class="btn btn-primary" type="button"  disabled="disabled" style="width: 100px;height: 30px;">已关注问题</button>
                    </c:when>
                    <c:otherwise >

                        <button class="btn btn-primary " type="submit"   style="width: 100px;height: 30px;">关注问题</button>
                    </c:otherwise>
                </c:choose>
                </form>
            </blockquote>

                <h5>
                    您可能感兴趣的问题：
                </h5>
                <br />
                <ul class="question-suggest" style="padding-left:10px;">
                    <c:forEach items="${recommendQuestionList}" var="recommendQuestion">
                        <a href="/questionDetail?questionId=${recommendArticle.id}">
                            <li class="question-suggest-list">
                                <i class="icon-video">▶</i>${recommendQuestion.title}
                            </li>
                        </a>
                        <br>
                    </c:forEach>
                </ul>
                <h5>
                    您可能感兴趣的文章：
                </h5>
                <br />
                <ul class="article-suggest" style="padding-left:10px;">
                    <c:forEach items="${recommendArticleList}" var="recommendArticle">
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
                    <c:forEach items="${recommendCourseList}" var="recommendCourse">
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
    <hr />

</div>
</body>
</html>
<script>
    function btnReplyClick(x,y) {
        var rreplyarea=document.getElementById("commenttxt"+x);
        rreplyarea.value="回复 @"+y+" :";
    }
    $(function() {
        editormd("test-editormd", {
            width   : "100%",
            height  : 640,
            syncScrolling : "single",
            emoji: true,
            path    : "${pageContext.request.contextPath }/style/editor/lib/",
            //这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
            saveHTMLToTextarea : true
        });
    });
</script>
