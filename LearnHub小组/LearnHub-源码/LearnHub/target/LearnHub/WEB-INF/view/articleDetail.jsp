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
<br>
<br>
<img src="${pageContext.request.contextPath }/style/img/article.png" style="height: 180px;width:1550px;" />
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="content-width">
                <h1>
                    ${article.title}
                </h1>
                <blockquote>
                    <p>
                        作者：${article.username}<br />阅读量：${article.clickNum}
                    </p> <small>类别：<cite>${article.articleType}</cite></small>
                    <br>
                    <form action="/follow" method="post">
                        <input name="userId" value="${loginUser.id}" hidden="hidden" />
                        <input name="focusId" value="${article.userId}" hidden="hidden" />
                        <input name="type" value="2" hidden="hidden" />
                        <input name="readId" value="${article.id}" hidden="hidden"/>
                        <c:choose>
                            <c:when test="${userFocus!=null}">
                                <button type="button" class="btn btn-primary" disabled="disabled" style="width: 120px;height: 40px">已关注作者</button>
                            </c:when>
                            <c:otherwise>
                                <button type="submit" class="btn btn-primary" style="width: 120px;height: 40px">关注作者</button>
                            </c:otherwise>
                        </c:choose>
                    </form>
                </blockquote>
                <p class="lead" id="doc-content">
                    ${article.content}
                </p>
                <p style="color: #D3D3D3;">
                    版权所属：LearnHub智能学习平台
                    <br />
                    转载请联系作者并标注出处
                </p>
                <form action="/praise" method="post">
                    <input name="userId" value="${loginUser.id}" hidden="hidden"/>
                    <input name="praiseId" value="${article.id}" hidden="hidden" />
                    <input name="type" value="1" hidden="hidden" />
                    <c:choose>
                        <c:when test="${userPraise !=null}">
                            <button class="btn btn-large btn-primary btn-block" disabled="disabled" type="button">已点赞(${article.praiseNum})</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-large btn-primary btn-block" type="submit">点赞(${article.praiseNum})</button>
                        </c:otherwise>
                    </c:choose>
                </form>
                <!-- 评论区 start -->
                <div id="commentQA" style="padding-top: 10px">
                    <div name="comment" class="form-group">
                        <label>发表评论：</label>
                        <div class="row">
                            <div class="col-md-1 col-xs-1 tobe-center" style="min-width: 50px;">
                                <img src="${pageContext.request.contextPath }/userimg/${loginUser.id}.jpg" class="img-circle" alt="Cinque Terre" style=" height: 40px;">
                            </div>
                            <div class="col-md-11 col-xs-11">
                                <form action="/addArticleComment" method="post">
                                    <input name="userName" value="${loginUser.username}" hidden="hidden"/>
                                    <input name="userId" value="${loginUser.id}" hidden="hidden"/>
                                    <input name="date" value="2018-07-14" hidden="hidden"/>
                                    <input name="commentType" value="2" hidden="hidden"/>
                                    <input name="commentRefId" value="${article.id}" hidden="hidden"/>
                                    <input name="praiseNum" value="0" hidden="hidden"/>
                                    <input name="replyNum" value="0" hidden="hidden"/>
                                    <div class="row">
                                        <div class="col-md-10 col-xs-10">
                                            <textarea id="ctxt" name="commentContent" class="form-control" placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。"  style="height: 60px; resize:none;"></textarea>
                                        </div>
                                        <div class="col-md-2 col-xs-2 tobe-center">
                                            <input id="commentbtn" type="submit" class="btn btn-primary" value="发表评论" style="height: 60px;">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <br />
                        <br />
                        <!-- 评论信息列表展示 -->
                        <div>

                            <ul id="commentList">
                                <!-- 先遍历评论信息（一条评论信息，下面的全是回复信息） -->
                                <c:forEach items="${commentList}" var="comment">
                                    <!-- 如果评论信息是在本课程下的才显示 -->
                                    <c:if  test="${comment.commentRefId eq article.id}">
                                        <div class="row">
                                            <div class="col-md-1 col-xs-1 tobe-center" style="min-width: 50px;">
                                                <img src="${pageContext.request.contextPath }/userimg/${comment.userId}.jpg" class="img-circle" alt="Cinque Terre" style=" height: 40px;">
                                            </div>
                                            <div class="col-md-11 col-xs-11">
                                                <div id="commentBox" class="panel-default">
                                                    <div class="panel-heading">
                                                        <h3 class="panel-title">
                                                                ${comment.userName}:
                                                        </h3>
                                                    </div>
                                                    <b id="commentArea${comment.id}" class="panel-body">
                                                        <div style="margin-left: 15px;">
                                                                ${comment.commentContent}<br><br>
                                                            <span class="text-list-date"><fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd" /></span>
                                                            <br><br>
                                                        </div>

                                                        <b/>
                                                        <!--
                                                            回复表单
                                                        -->
                                                        <div class="panel-footer">

                                                            <div id="replyList" class="panel" style="margin-bottom:0px;">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a data-toggle="collapse" data-parent="#accordion" href="#${comment.id}">
                                                                            <u>展开/折叠回复(${comment.replyNum})</u>
                                                                        </a>
                                                                    </h4>
                                                                </div>
                                                                <div id="${comment.id}" class="panel-collapse collapse  ">
                                                                    <form action="/addArticleReply" method="post">
                                                                        <input name="userId" value="${loginUser.id}" hidden="hidden"/>
                                                                        <input name="userName" value="${loginUser.username}" hidden="hidden"/>
                                                                        <input name="date" value="" hidden="hidden"/>
                                                                        <input name="replyType" value="2" hidden="hidden"/>
                                                                        <input name="replyRefId" value="${comment.commentRefId}" hidden="hidden"/>
                                                                        <input name="replyParentId" value="${comment.id}" hidden="hidden"/>
                                                                        <input name="praiseNum" value="0" hidden="hidden"/>
                                                                        <div class="row">
                                                                            <div class="col-md-10" style="padding-left: 30px;">
                                                                                <textarea name="replyContent" id="reptxt${comment.id}" class="form-control" value="" placeholder="回复..." style="height: 40px; resize:none;"></textarea>
                                                                            </div>
                                                                            <div class="col-md-2">
                                                                                <button id="replyBtn" type="submit" class="btn btn-primary" style="height: 40px;" >回复</button>
                                                                            </div>
                                                                        </div>


                                                                    </form>
                                                                    <c:forEach items="${replyList}" var="reply">
                                                                        <!-- 每次遍历出来的评论下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                                                                        <c:if test="${reply.replyRefId eq article.id && reply.replyParentId eq comment.id}">

                                                                            <div class="panel-body">
                                                                                <span style="color: blue;">${reply.userName}</span>:&nbsp;${reply.replyContent}
                                                                                <br><br>
                                                                                <span class="text-list-date"><fmt:formatDate value="${reply.date}" pattern="yyyy-MM-dd" /></span>

                                                                                <p>
                                                                                    <a  onclick="btnReplyClick('${reply.replyParentId}','${reply.userName}')"  href="#commentArea${comment.id}">回复</a>
                                                                                </p>
                                                                            </div>
                                                                            <hr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>

                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 评论区 end -->
            </div>

        </div>
        <div class="col-md-4" >
            <h3>
                您可能感兴趣的文章
            </h3>
            <br />
            <ul class="articl-suggest" style="padding-left:10px;">
                <!--以后加上循环语句来显示推荐文章链接-->
                <c:forEach items="${recommendArticleList}" var="recommendArticle">
                    <a href="/articleDetail?articleId=${recommendArticle.id}">
                        <li class="article-suggest-list">
                            <i class="icon-video">▶</i>${recommendArticle.title}
                        </li>
                    </a>
                    <br>
                </c:forEach>
            </ul>
            <h3>
                您可能感兴趣的问题：
            </h3>
            <br />
            <ul class="question-suggest" style="padding-left:10px;">
                <c:forEach items="${recommendQuestionList}" var="recommendQuestion">
                    <a href="/questionDetail?questionId=${recommendQuestion.id}">
                        <li class="question-suggest-list">
                            <i class="icon-video">▶</i>${recommendQuestion.title}
                        </li>
                    </a>
                    <br>
                </c:forEach>
            </ul>
            <h3>
                您可能感兴趣的课程：
            </h3>
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
    <div class="row">
        <div class="col-md-8">
        </div>
        <div class="col-md-4">
        </div>
    </div>
</div>
<script type="text/javascript">
    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
            htmlDecode: "style,script,iframe",
            emoji: true,
            taskList: true,
            tex: true, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true,
        });});
</script>

</body>
</html>
