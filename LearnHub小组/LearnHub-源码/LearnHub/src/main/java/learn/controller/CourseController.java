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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Kai on 2019/4/11.
 */

@Controller
public class CourseController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private CourseSectionService courseSectionService;
    @Autowired
    private CourseTypeDefineService courseTypeDefineService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ReplyService replyService;
    @Autowired
    private ExamService examService;
    @Autowired
    private UserFocusService userFocusService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private QuestionService questionService;

    //课程列表页面
    @RequestMapping(value = "/course", method = RequestMethod.GET)
    public ModelAndView getCourse(){
        ModelAndView mv = new ModelAndView();
        int curCode = 0;
        try {
            List<Course> courses= courseService.selectAll();
            System.out.println(courses);
            List<CourseTypeDefine> fields = courseTypeDefineService.selectAll();
            mv.addObject("fields", fields);
            mv.setViewName("course");
            mv.addObject("curCode", curCode);
            mv.addObject("courses", courses);
        } catch (Exception e) {
            mv.setViewName("error/error");
            e.printStackTrace();
        }
        return mv;
    }

    @RequestMapping(value = "/courseType", method = RequestMethod.GET)
    public ModelAndView getCourseType(int id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("course");
        if(id == 0){
            return new ModelAndView("redirect:/course");
        }
        int curCode = id;
        mv.addObject("curCode", curCode);
        List<CourseTypeDefine> fields = courseTypeDefineService.selectAll();
        mv.addObject("fields", fields);
        CourseTypeDefine tempType = courseTypeDefineService.selectByPrimaryKey(id);
        List<Course> courses= courseService.selectByType(tempType.getName());
        System.out.println(courses);
        mv.addObject("courses", courses);
        return mv;
    }

    @RequestMapping(value = "/courseDetail", method = RequestMethod.GET)
    public ModelAndView getDetail(int courseId, HttpSession session, HttpServletRequest request,
                            HttpServletResponse response, Model model) {
        ModelAndView mv = new ModelAndView();
        User user = (User)session.getAttribute("loginUser");
        if(user != null){
            Integer userId = user.getId();
            Integer focusId = courseId;
            UserFocus userFocus = userFocusService.selectByUserIdAndFocusId(userId, focusId, 1);
            if(userFocus != null){
                mv.addObject("userFocus", userFocus);
            }
        }
        Course course = courseService.selectByPrimaryKey(courseId);
        List<CourseSectionVO> courseSectionLists = courseSectionService.queryCourseSection(courseId);
        List<Comment> commentList = commentService.selectCommentByCourseId(courseId);
        List<Reply> replyList = replyService.selectReplyByCourseId(courseId);
        Exam exam = examService.selectExamByCourseId(courseId);

        //推荐文章课程与问答
        String courseType = course.getCourseType();
        List<Course> tempRecommendCourseList = courseService.selectByType(courseType);
        List<Course> recommendCourseList = new ArrayList<>();
        for(Course tempCourse:tempRecommendCourseList){
            if(!tempCourse.getCourseId().equals(courseId)){
                recommendCourseList.add(tempCourse);
            }
        }
        mv.addObject("recommendCourseList",recommendCourseList);
        List<Article> recommendArticleList = articleService.selectByType(courseType);
        List<Question> recommendQuestionList = questionService.selectByType(courseType);
        mv.addObject("recommendArticleList",recommendArticleList);
        mv.addObject("recommendQuestionList",recommendQuestionList);

        mv.addObject("course", course);
        mv.addObject("courseSectionLists", courseSectionLists);
        mv.addObject("commentList", commentList);
        mv.addObject("replyList", replyList);
        mv.addObject("exam", exam);
        return mv;
    }

    @RequestMapping(value = "/searchCourse", method = RequestMethod.POST)
    public ModelAndView searchCourse(String searchString){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("course");
        List<Course> courses= courseService.search(searchString);
        System.out.println(courses);
        List<CourseTypeDefine> fields = courseTypeDefineService.selectAll();
        mv.addObject("searchString",searchString);
        mv.addObject("fields", fields);
        mv.addObject("courses", courses);
        return mv;
    }

    @RequestMapping(value = "/courseVideo", method = RequestMethod.GET)
    public ModelAndView getCourseVideo(int id, HttpSession session){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("courseVideo");
        CourseSection courseSection = courseSectionService.selectByPrimaryKey(id);
        List<CourseSectionVO> courseSectionLists = courseSectionService.queryCourseSection(courseSection.getCourseId());
        mv.addObject("courseSectionLists", courseSectionLists);
        mv.addObject("thisCourseSection", courseSection);
        //更新已学过的课程
        User user = (User)session.getAttribute("loginUser");
        if(user != null){
            Integer userId = user.getId();
            Integer focusId = courseSection.getCourseId();
            UserFocus userFocus = userFocusService.selectByUserIdAndFocusId(userId, focusId, 1);
            if(userFocus != null){
                userFocus.setReadId(id);
                userFocusService.updateByPrimaryKeySelective(userFocus);
            }else{
                UserFocus newUserFoucs = new UserFocus();
                newUserFoucs.setUserId(userId);
                newUserFoucs.setFocusId(focusId);
                newUserFoucs.setType(1);
                newUserFoucs.setReadId(id);
                userFocusService.insert(newUserFoucs);
            }
        }
        return mv;
    }
    @RequestMapping(value = "/addCourseComment", method = RequestMethod.POST)
    public String addComment(Comment comment, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return"redirect:login";
        }
        Date date = new Date();
        comment.setDate(date);
        commentService.insertSelective(comment);
        Integer courseId = comment.getCommentRefId();
        return "redirect:courseDetail?courseId=" + courseId;
    }

    @RequestMapping(value = "/addCourseReply", method = RequestMethod.POST)
    public String addReply(Reply reply, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return"redirect:login";
        }
        Date date = new Date();
        reply.setDate(date);
        replyService.insertSelective(reply);
        commentService.updateReplyNum(+1, reply.getReplyParentId());
        Integer courseId = reply.getReplyRefId();
        return "redirect:courseDetail?courseId=" + courseId;
    }
    /*@RequestMapping(value = "/addCourseReply", method = RequestMethod.POST)
    @ResponseBody
    public Reply addReply(Reply reply) {
        Date date = new Date();
        reply.setDate(date);
        replyService.insertSelective(reply);
        commentService.updateReplyNum(+1, reply.getReplyParentId());
        Integer courseId = reply.getReplyRefId();
        return reply;
    }*/

}
