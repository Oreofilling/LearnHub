<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <meta content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/extend.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/Mycss.css">
    <script src="${pageContext.request.contextPath }/style/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>

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

<div style="height: 60px;"></div>

<div class="f-main clearfix">
    <div class="f-main clearfix">
        <div class="main-course-left">
            <!-- 基础信息 - start -->
            <div class="course-info">
                <div class="course-title">${course.courseName}</div>

                <div class="course-meta">
                    <a href="#" class="learn-btn">继续学习</a>


                    <div class="static-item">
                        <div class="meta">学习人数</div>
                        <div class="meta-value">${course.studyCount}</div>
                    </div>
                    <div class="static-item" style="border:none;">
                        <div class="meta">课程领域</div>
                        <div class="meta-value">
                            ${course.courseType}
                        </div>
                    </div>

                    <a id="collectionSpan" onclick="" href="javascript:void(0)" class="following" style="float: right;margin-top:5px;">
                    </a>
                </div>

                <div class="course-brief">
                    ${course.courseDetail}
                </div>

                <div class="course-menu">
                    <a href="javascript:void(0)">
                        <span onclick="showTab(this,'courseSection')" class="menu-item cur">章节</span>
                    </a>
                    <a href="javascript:void(0)">
                        <span onclick="showTab(this,'commentQA',0)" class="menu-item">评论</span>
                    </a>
                </div>
            </div>
            <!-- 基础信息 - end -->

            <!-- 章节信息 - start -->
            <div id="courseSection">
                <c:forEach var="courseSectionList" items="${courseSectionLists}">
                    <div class="chapter">
                        <a href="javascript:void(0);" class="js-open">
                            <h3>
                                <strong>
                                    <div class="icon-chapter">=</div>
                                        ${courseSectionList.name}</strong>
                                <span class="drop-down">▼</span>
                            </h3>
                        </a>
                        <ul class="chapter-sub">
                            <c:forEach var="courseSection" items="${courseSectionList.sections}">
                                <a href="/courseVideo?id=${courseSection.id}">
                                    <li class="chapter-sub-li">
                                        <i class="icon-video">▶</i>${courseSection.name}
                                    </li>
                                </a>
                            </c:forEach>
                        </ul>
                    </div>
                </c:forEach>
            </div>
            <!-- 章节信息 - end -->

            <!-- 评论区 start -->
            <div id="commentQA"style="display :none ; padding-top: 10px">
                <div name="comment" class="form-group">
                <label>发表评论：</label>
                    <div class="row">
                        <div class="col-md-1 col-xs-1 tobe-center" style="min-width: 50px;">
                            <img src="${pageContext.request.contextPath }/userimg/${loginUser.id}.jpg" class="img-circle" alt="Cinque Terre" style=" height: 40px;">
                        </div>
                        <div class="col-md-11 col-xs-11">
                            <form action="/addCourseComment" method="post">
                                <input name="userName" value="${loginUser.username}" hidden="hidden"/>
                                <input name="userId" value="${loginUser.id}" hidden="hidden"/>
                                <input name="date" value="2018-07-14" hidden="hidden"/>
                                <input name="commentType" value="1" hidden="hidden"/>
                                <input name="commentRefId" value="${course.courseId}" hidden="hidden"/>
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
                        <c:if  test="${comment.commentRefId eq course.courseId}">
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
                                                        <form action="/addCourseReply" method="post">
                                                            <input name="userId" value="${loginUser.id}" hidden="hidden"/>
                                                            <input name="userName" value="${loginUser.username}" hidden="hidden"/>
                                                            <input name="date" value="" hidden="hidden"/>
                                                            <input name="replyType" value="1" hidden="hidden"/>
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
                                                            <c:if test="${reply.replyRefId eq course.courseId && reply.replyParentId eq comment.id}">

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
</div>



<script type="text/javascript">

    $(function(){
        //实现 章节鼠标焦点 动态效果
        $('.chapter li').hover(function(){
            $(this).find('.icon-video').css('color','#FFF');
        },function(){
            $(this).find('.icon-video').css('color','#777');
        });

        $('.js-open').click(function(){
            var display = $(this).parent().find('ul').css('display');
            if(display == 'none'){
                $(this).parent().find('ul').css('display','block');
                $(this).find('.drop-down').html('▼');
            }else{
                $(this).parent().find('ul').css('display','none');
                $(this).find('.drop-down').html('▲');
            }
        });
    });
    function btnReplyClick(x,y) {
        var rreplyarea=document.getElementById("reptxt"+x);
        rreplyarea.value="回复 @"+y+" :";
    }
    /**
     *展示tab commentQA
     **/
    function showTab(el,divId,type){
        $('.course-menu').find('span').each(function(i,item){
            $(item).removeClass('cur');
        });
        $(el).addClass('cur');

        if(divId == 'courseSection'){
            $('#courseSection').show();
            $('#commentQA').hide();
        }else {
            $('#commentQA').show();
            $('#courseSection').hide();

        }
    }
    $("#replyBtn").click(function(){

        var userId = $("#userId").val();
        var userName = $("#userName").val();
        var date = $("#date").val();
        var replyType = $("#replyType").val();
        var replyRefId = $("#replyRefId").val();
        var replyParentId = $("#replyParentId").val();
        var praiseNum = $("#praiseNum").val();
        var replyContent = $("#replyContent").val();
        $.ajax({
            url: '/addCourseReply',
            type: 'POST',
            data: [{
                userId: userId,
                userName: userName,
                date: date,
                replyType: replyType,
                replyRefId: replyRefId,
                replyParentId: replyParentId,
                praiseNum: praiseNum,
                replyContent: replyContent
            }],
            success: function(data){
                layer.open({
                    title: '提示信息',
                    content: '留言成功',
                    btn: ['确定'],
                    btn1: function(index){
                        $("body").html(data);
                    }
                });
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '出现未知错误'
                });
            }
        });
    });
</script>
</body>
</html>
