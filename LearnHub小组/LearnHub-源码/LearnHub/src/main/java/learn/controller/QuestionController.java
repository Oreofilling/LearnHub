package learn.controller;

import learn.entity.*;
import learn.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Kai on 2019/4/13.
 */
@Controller
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;
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
    private ArticleService articleService;
    @Autowired
    private UserPraiseService userPraiseService;

    @RequestMapping(value = "/question", method = RequestMethod.GET)
    public ModelAndView getQuestion(@RequestParam(value="type", defaultValue="0")int type,
                                    @RequestParam(value="tab", defaultValue="1")int tab){
        ModelAndView mv = new ModelAndView();
        int curCode = type;
        mv.addObject("curCode", curCode);
        mv.addObject("tab", tab);
        try {
            List<CourseTypeDefine> fields = courseTypeDefineService.selectAll();
            List<QuestionAndBestAnswer> questionAndBestAnswerList = new ArrayList<>();
            mv.addObject("fields", fields);
            mv.addObject("curCode", curCode);
            if(type == 0){
                questionAndBestAnswerList= questionService.queryQuestionAndBestAnswer("全部", tab);
            }else{
                CourseTypeDefine courseTypeDefine = courseTypeDefineService.selectByPrimaryKey(type);
                String typeStr = courseTypeDefine.getName();
                questionAndBestAnswerList= questionService.queryQuestionAndBestAnswer(typeStr, tab);
            }
            for(QuestionAndBestAnswer questionAndBestAnswer:questionAndBestAnswerList){
                if(questionAndBestAnswer.getAnswerContent() != null){
                    Pattern pattern = Pattern.compile("<[^>]*>");
                    Matcher matcher = pattern.matcher(questionAndBestAnswer.getAnswerContent());
                    String result = matcher.replaceAll("");
                    questionAndBestAnswer.setAnswerContent(result);
                }
            }
            mv.addObject("questionList", questionAndBestAnswerList);
            List<Course> recommendCourses = courseService.selectFive();
            List<Article> recommendArticles = articleService.selectFive();
            mv.addObject("recommendCourses", recommendCourses);
            mv.addObject("recommendArticles", recommendArticles);
        } catch (Exception e) {
            mv.setViewName("error/error");
            e.printStackTrace();
        }
        return mv;
    }

    @RequestMapping(value = "/searchQuestion", method = RequestMethod.POST)
    public ModelAndView searchArticle(String searchString){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("question");
        List<QuestionAndBestAnswer> questionAndBestAnswerList = questionService.searchQuestionAndBestAnswer(searchString);
        List<CourseTypeDefine> fields = courseTypeDefineService.selectAll();
        mv.addObject("fields", fields);
        mv.addObject("searchString",searchString);
        mv.addObject("questionList", questionAndBestAnswerList);
        return mv;
    }

    @RequestMapping(value = "/questionDetail", method = RequestMethod.GET)
    public ModelAndView getQuestionDetail(Integer questionId, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Question question = questionService.selectByPrimaryKey(questionId);
        String questionType = question.getType();
        List<Question> tempRecommendQuestionList = questionService.selectByType(questionType);
        List<Question> recommendQuestionList = new ArrayList<>();
        List<Answer> answerList = answerService.selectByQuestionId(questionId);
        if(answerList != null){
            List<Comment> commentList = new ArrayList<>();
            List<Reply> replyList = new ArrayList<>();
            for(Answer answer:answerList){
                List<Comment> tempCommentList = commentService.selectCommentByAnswerId(answer.getId());
                List<Reply> tempReplyList = replyService.selectReplyByAnswerId(answer.getId());
                commentList.addAll(tempCommentList);
                replyList.addAll(tempReplyList);
            }
            mv.addObject("commentList", commentList);
            mv.addObject("replyList", replyList);
        }
        //推荐文章课程和回答
        for(Question tempQuestion:tempRecommendQuestionList){
            if(!tempQuestion.getId().equals(questionId)){
                recommendQuestionList.add(tempQuestion);
            }
        }
        mv.addObject("recommendQuestionList", recommendQuestionList);
        List<Course> recommendCourseList = courseService.selectByType(questionType);
        List<Article> recommendArticleList = articleService.selectByType(questionType);
        mv.addObject("recommendCourseList",recommendCourseList);
        mv.addObject("recommendArticleList",recommendArticleList);

        questionService.updateClickNum(+1,questionId);
        question = questionService.selectByPrimaryKey(questionId);
        mv.addObject("question", question);
        mv.addObject("answerList", answerList);


        User user = (User)session.getAttribute("loginUser");
        if(user != null ){
            Integer userId = user.getId();
            Integer focusId = questionId;
            UserFocus userFocus = userFocusService.selectByUserIdAndFocusId(userId, focusId,3);
            if(userFocus != null){
                mv.addObject("userFocus", userFocus);
                if(!question.getAnswerNum().equals(0)){
                    Integer tempReadId = 0;
                    for(Answer answer:answerList){
                        if(answer.getId()>tempReadId){
                            tempReadId = answer.getId();
                        }
                    }
                    if(userFocus.getReadId() < tempReadId){
                        userFocus.setReadId(tempReadId);
                        userFocusService.updateByPrimaryKeySelective(userFocus);
                    }
                }
            }

        }
        List<Answer> noPraiseAnswerList = new ArrayList<>();
        if(user != null && !question.getAnswerNum().equals(0)){
            List<UserPraise> userPraiseList = new ArrayList<>();
            for(Answer answer:answerList){
                UserPraise userPraise = userPraiseService.selectByUserIdAndPraiseId(user.getId(), answer.getId(),2);
                if(userPraise != null){
                    userPraiseList.add(userPraise);
                }else{
                    noPraiseAnswerList.add(answer);
                }
            }
            mv.addObject("userPraiseList", userPraiseList);
            mv.addObject("noPraiseAnswerList", noPraiseAnswerList);
        }

        return mv;
    }

    @RequestMapping(value = "/createQuestion", method = RequestMethod.GET)
    public ModelAndView createQuestion(HttpSession session) {
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return new ModelAndView("redirect:/login");
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("createQuestion");
        return mv;
    }

    @RequestMapping(value = "/submitQuestion", method = RequestMethod.POST)
    public String submitQuestion(Question question, HttpSession session) {
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }
        Date date = new Date();
        question.setDate(date);
        questionService.insert(question);
        Integer questionId = question.getId();//该对象的自增ID
        return "redirect:questionDetail?questionId=" + questionId;
    }

    @RequestMapping(value = "/submitAnswer", method = RequestMethod.POST)
    public String submitAnswer(Answer answer, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }
        Date date = new Date();
        answer.setDate(date);
        answerService.insert(answer);
        questionService.updateAnswerNum(+1, answer.getQuestionId());
        return "redirect:questionDetail?questionId=" + answer.getQuestionId();
    }

    @RequestMapping(value = "/addAnswerComment", method = RequestMethod.POST)
    public String addAnswerComment(Comment comment,HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }
        Date date = new Date();
        comment.setDate(date);
        commentService.insertSelective(comment);
        Integer answerId = comment.getCommentRefId();
        answerService.updateCommentNum(+1, answerId);
        Answer answer = answerService.selectByPrimaryKey(answerId);
        return "redirect:questionDetail?questionId=" + answer.getQuestionId();
    }

    @RequestMapping(value = "/addAnswerReply", method = RequestMethod.POST)
    public String addAnswerReply(Reply reply,HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }
        Date date = new Date();
        reply.setDate(date);
        replyService.insertSelective(reply);
        commentService.updateReplyNum(+1, reply.getReplyParentId());
        Answer answer = answerService.selectByPrimaryKey(reply.getReplyRefId());
        return "redirect:questionDetail?questionId=" + answer.getQuestionId();
    }

}
