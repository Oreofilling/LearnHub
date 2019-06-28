package learn.controller;

import learn.entity.*;
import learn.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Kai on 2019/4/06.
 */

@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CourseTypeDefineService courseTypeDefineService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ReplyService replyService;
    @Autowired
    private UserFocusService userFocusService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private UserPraiseService userPraiseService;

    //文章列表页面
    @RequestMapping(value = "/article", method = RequestMethod.GET)
    public ModelAndView getArticle() {
        ModelAndView mv = new ModelAndView();
        int curCode = 0;
        try {
            List<Article> articleList = articleService.selectAll();
            List<CourseTypeDefine> fields = courseTypeDefineService.selectAll();
            mv.addObject("fields", fields);
            mv.setViewName("article");
            mv.addObject("curCode", curCode);
            mv.addObject("articleList", articleList);
            List<Course> recommendCourses = courseService.selectFive();
            List<QuestionAndBestAnswer> recommendQuestions = questionService.selectFiveQuestionAndBestAnswer();
            for(QuestionAndBestAnswer questionAndBestAnswer:recommendQuestions){
                if(questionAndBestAnswer.getAnswerContent() != null){
                    Pattern pattern = Pattern.compile("<[^>]*>");
                    Matcher matcher = pattern.matcher(questionAndBestAnswer.getAnswerContent());
                    String result = matcher.replaceAll("");
                    questionAndBestAnswer.setAnswerContent(result);
                }
            }
            mv.addObject("recommendCourses", recommendCourses);
            mv.addObject("recommendQuestions", recommendQuestions);
        } catch (Exception e) {
            mv.setViewName("error/error");
            e.printStackTrace();
        }
        return mv;
    }

    @RequestMapping(value = "/articleType", method = RequestMethod.GET)
    public ModelAndView getArticleType(int id) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("article");
        if (id == 0) {
            return new ModelAndView("redirect:/article");
        }
        int curCode = id;
        mv.addObject("curCode", curCode);
        List<CourseTypeDefine> fields = courseTypeDefineService.selectAll();
        mv.addObject("fields", fields);
        CourseTypeDefine tempType = courseTypeDefineService.selectByPrimaryKey(id);
        List<Article> articleList = articleService.selectByType(tempType.getName());
        mv.addObject("articleList", articleList);
        List<Course> recommendCourses = courseService.selectFive();
        List<QuestionAndBestAnswer> recommendQuestions = questionService.selectFiveQuestionAndBestAnswer();
        mv.addObject("recommendCourses", recommendCourses);
        mv.addObject("recommendQuestions", recommendQuestions);
        return mv;
    }

    @RequestMapping(value = "/searchArticle", method = RequestMethod.POST)
    public ModelAndView searchArticle(String searchString) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("article");
        List<Article> articleList = articleService.search(searchString);
        List<CourseTypeDefine> fields = courseTypeDefineService.selectAll();
        mv.addObject("fields", fields);
        mv.addObject("searchString", searchString);
        mv.addObject("articleList", articleList);
        return mv;
    }

    @RequestMapping(value = "/createArticle", method = RequestMethod.GET)
    public ModelAndView createArticle(HttpSession session) {
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return new ModelAndView("redirect:/login");
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("createArticle");
        return mv;
    }

    @RequestMapping(value = "/submitArticle", method = RequestMethod.POST)
    public String submitArticle(Article article, HttpSession session, MultipartFile pic) throws IllegalStateException, IOException {
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }
        Date date = new Date();
        article.setDate(date);
        articleService.insert(article);
        Integer articleId = article.getId();//该对象的自增ID
        if (!pic.isEmpty()) {
            String path = "D:\\articleimg\\";
            String originalFileName = pic.getOriginalFilename();
            // 新的图片名称
            String newFileName;
            if(!originalFileName.substring(originalFileName.lastIndexOf(".")).equals("jpg")){
                newFileName = articleId +".jpg";
            }else{
                newFileName = articleId + originalFileName.substring(originalFileName.lastIndexOf("."));
            }
            // 新的图片
            File newFile = new File(path + newFileName);
            // 将内存中的数据写入磁盘
            pic.transferTo(newFile);
        }
        return "redirect:articleDetail?articleId=" + articleId;
    }

    @RequestMapping(value = "/articleDetail", method = RequestMethod.GET)
    public ModelAndView getArticleDetail(Integer articleId, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Article article = articleService.selectByPrimaryKey(articleId);

        //更新关注关系中的动态及读取点赞信息
        User user = (User)session.getAttribute("loginUser");
        if(user != null){
            Integer userId = user.getId();
            Integer focusId = article.getUserId();
            UserFocus userFocus = userFocusService.selectByUserIdAndFocusId(userId, focusId, 2);
            if(userFocus != null){
                mv.addObject("userFocus", userFocus);
                if(userFocus.getReadId() < articleId){
                    userFocus.setReadId(articleId);
                    userFocusService.updateByPrimaryKeySelective(userFocus);
                }
            }
            UserPraise userPraise = userPraiseService.selectByUserIdAndPraiseId(user.getId(), articleId, 1);
            if(userPraise != null){
                mv.addObject("userPraise", userPraise);
            }
        }

        //推荐文章课程与问答
        String articleType = article.getArticleType();
        List<Article> tempRecommendArticleList = articleService.selectByType(articleType);
        List<Article> recommendArticleList = new ArrayList<>();
        List<Comment> commentList = commentService.selectCommentByArticleId(articleId);
        List<Reply> replyList = replyService.selectReplyByArticleId(articleId);
        for(Article tempArtircle:tempRecommendArticleList){
            if(!tempArtircle.getId().equals(articleId)){
                recommendArticleList.add(tempArtircle);
            }
        }
        mv.addObject("recommendArticleList",recommendArticleList);
        List<Course> recommendCourseList = courseService.selectByType(articleType);
        List<Question> recommendQuestionList = questionService.selectByType(articleType);
        mv.addObject("recommendCourseList",recommendCourseList);
        mv.addObject("recommendQuestionList",recommendQuestionList);

        articleService.updateClickNum(+1,articleId);
        article = articleService.selectByPrimaryKey(articleId);
        mv.addObject("commentList", commentList);
        mv.addObject("replyList", replyList);
        mv.addObject("article", article);
        return mv;
    }

    @RequestMapping(value = "/addArticleComment", method = RequestMethod.POST)
    public String addArticleComment(Comment comment,HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return"redirect:login";
        }
        Date date = new Date();
        comment.setDate(date);
        commentService.insertSelective(comment);
        Integer articleId = comment.getCommentRefId();
        articleService.updateCommentNum(+1, articleId);
        return "redirect:articleDetail?articleId=" + articleId;
    }

    @RequestMapping(value = "/addArticleReply", method = RequestMethod.POST)
    public String addArticleReply(Reply reply,HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return"redirect:login";
        }
        Date date = new Date();
        reply.setDate(date);
        replyService.insertSelective(reply);
        commentService.updateReplyNum(+1, reply.getReplyParentId());
        Integer articleId = reply.getReplyRefId();
        return "redirect:articleDetail?articleId=" + articleId;
    }

    /*@RequestMapping(value = "/modifyArticle", method = RequestMethod.GET)
    public ModelAndView createArticle(HttpSession session, Integer articleId) {
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return new ModelAndView("redirect:/login");
        }
        Article article = articleService.selectByPrimaryKey(articleId);
        if(!user.getId().equals(article.getUserId())){
            return new ModelAndView("redirect:/articleDetail?articleId="+articleId);
        }
        ModelAndView mv = new ModelAndView();
        mv.addObject(article);
        return mv;
    }
    */
    /*@RequestMapping(value = "/submitModifyArticle", method = RequestMethod.POST)
    public String submitModifyArticle(Article article, HttpSession session) {
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }
        Date date = new Date();
        article.setDate(date);
        articleService.updateByPrimaryKeySelective(article);
        return "redirect:articleDetail?articleId=" + article.getId();
    }
    */
}