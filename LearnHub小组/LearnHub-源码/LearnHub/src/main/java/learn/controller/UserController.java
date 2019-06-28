package learn.controller;

import learn.entity.*;
import learn.service.*;

import learn.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created by Kai on 2019/4/11.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private CourseSectionService courseSectionService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;
    @Autowired
    private UserFocusService userFocusService;
    @Autowired
    private UserPraiseService userPraiseService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ReplyService replyService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getIndex(HttpSession session) {
        /*ModelAndView mv = new ModelAndView();
        mv.setViewName("course");
        return mv;*/
        return new ModelAndView("redirect:homePage");

    }

    @RequestMapping(value = "/homePage", method = RequestMethod.GET)
    public ModelAndView getHomePage() {
        ModelAndView mv = new ModelAndView();
        try {
            List<Course> recommendCourses = courseService.selectFive();
            List<Article> recommendArticles = articleService.selectFive();
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
            mv.addObject("recommendArticles", recommendArticles);
            mv.addObject("recommendQuestions", recommendQuestions);
        } catch (Exception e) {
            mv.setViewName("error/error");
            e.printStackTrace();
        }
        return mv;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(HttpServletRequest request, HttpSession session) {
        User user = (User)session.getAttribute("loginUser");
        if(user != null){
            return"redirect:course";
        }
        session.setAttribute("refPage", request.getHeader("Referer"));
        return "register";
    }

    @RequestMapping(value = "/getRegister", method = RequestMethod.POST)
    public ModelAndView getRegister(User user, HttpSession session) {
        try {
            user.setPassword(MD5Util.md5Encode(user.getPassword()));
            userService.save(user);
            Integer id = user.getId();
            System.out.println(id);
			/* UserRole userRole = userRoleService.selectByUserId(id); */
            session.setAttribute("loginUser", userService.selectById(user.getId()));
            Object refPage = session.getAttribute("refPage");
            if(refPage == null) {
                //说明直接登录
                return new ModelAndView("redirect:course");
            }else {
                return new ModelAndView("redirect:" + refPage.toString());
            }
        } catch (Exception e) {
            ModelAndView mv = new ModelAndView("register");
            mv.addObject("message", "您已注册！");
            return mv;
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request, HttpSession session) {
        User user = (User)session.getAttribute("loginUser");
        if(user != null){
            return"redirect:/course";
        }
        session.setAttribute("refPage", request.getHeader("Referer"));
        return "login";
    }

    @RequestMapping(value = "/getLogin", method = RequestMethod.POST)
    public ModelAndView getLogin(User user, HttpSession session) {
        User loginUser = new User();
        try {
            user.setPassword(MD5Util.md5Encode(user.getPassword()));
            loginUser = userService.checkLogin(user.getUsername(),user.getPassword());
        }catch (Exception e) {
            ModelAndView mv = new ModelAndView("login");
            mv.addObject("message", "用户名或密码错误！");
            return mv;
        }

        if(loginUser != null){
            session.setAttribute("loginUser", loginUser);
            System.out.println(loginUser);
            Object refPage = session.getAttribute("refPage");
            //if(refPage == null || refPage.equals("getLogin")){
            if(refPage == null){
            //说明直接登录
                return new ModelAndView("redirect:course");
            }else {
                return new ModelAndView("redirect:" + refPage);
            }
        }else {
            ModelAndView mv = new ModelAndView("login");
            mv.addObject("message", "用户名或密码错误！");
            return mv;
        }
    }

    @RequestMapping(value = "/user/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginUser");
        return "redirect:/";
    }

    @RequestMapping(value = "/mySpace", method = RequestMethod.GET)
    public ModelAndView getMySpace(HttpSession session, @RequestParam(value="tab", defaultValue="1")int tab,
                                   @RequestParam(value="message", defaultValue="")String message){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return new ModelAndView("redirect:/login");
        }
        ModelAndView mv = new ModelAndView();
        Integer userId = user.getId();
        try {
            List<Article> userArticleList = articleService.selectByUser(userId);  //用户创作的文章的List
            List<UserFocus> userFocusList = userFocusService.selectByUserId(userId);
            List<Article> focusArticleList = new ArrayList<>();  //有新动态的文章的List
            List<QuestionAndBestAnswer> focusQuestionList = new ArrayList<>();  //有新动态的问答的List
            List<User> allFocusUserList = new ArrayList<>(); //关注的用户的List
            List<QuestionAndBestAnswer> allFocusQuestionList = new ArrayList<>();  //关注的问答的List
            List<CourseAndSection> courseAndSectionList = new ArrayList<>();  //关注的课程的List
            for(UserFocus userFocus:userFocusList){
                if(userFocus.getType().equals(1)){
                    Course course = courseService.selectByPrimaryKey(userFocus.getFocusId());
                    CourseSection courseSection = courseSectionService.selectByPrimaryKey(userFocus.getReadId());
                    CourseAndSection courseAndSection = new CourseAndSection();
                    courseAndSection.setCourseId(course.getCourseId());
                    courseAndSection.setCourseName(course.getCourseName());
                    courseAndSection.setSectionId(courseSection.getId());
                    courseAndSection.setSectionName(courseSection.getName());
                    courseAndSectionList.add(courseAndSection);
                }else if(userFocus.getType().equals(2)){
                    User focusUser = userService.selectById(userFocus.getFocusId());
                    allFocusUserList.add(focusUser);
                    List<Article> tempArticleList = articleService.selectByUser(userFocus.getFocusId());
                    for(Article article:tempArticleList){
                        if(article.getId() > userFocus.getReadId()){
                            focusArticleList.add(article);
                        }
                    }
                }else if(userFocus.getType().equals(3)){
                    allFocusQuestionList.add(questionService.selectQuestionAndBestAnswer(userFocus.getFocusId()));
                    List<Answer> tempArticleList = answerService.selectByQuestionId(userFocus.getFocusId());
                    Integer newAnswerId = 0;
                    for(Answer answer:tempArticleList){
                        if(answer.getId() >  newAnswerId){
                            newAnswerId = answer.getId();
                        }
                    }
                    if(newAnswerId > userFocus.getReadId()){
                        focusQuestionList.add(questionService.selectQuestionAndBestAnswer(userFocus.getFocusId()));
                    }

                }
            }
            for(QuestionAndBestAnswer questionAndBestAnswer:allFocusQuestionList){
                if(questionAndBestAnswer.getAnswerContent() != null){
                    Pattern pattern = Pattern.compile("<[^>]*>");
                    Matcher matcher = pattern.matcher(questionAndBestAnswer.getAnswerContent());
                    String result = matcher.replaceAll("");
                    questionAndBestAnswer.setAnswerContent(result);
                }
            }
            for(QuestionAndBestAnswer questionAndBestAnswer:focusQuestionList){
                if(questionAndBestAnswer.getAnswerContent() != null){
                    Pattern pattern = Pattern.compile("<[^>]*>");
                    Matcher matcher = pattern.matcher(questionAndBestAnswer.getAnswerContent());
                    String result = matcher.replaceAll("");
                    questionAndBestAnswer.setAnswerContent(result);
                }
            }
            mv.addObject("userArticleList", userArticleList);
            mv.addObject("focusArticleList", focusArticleList);
            mv.addObject("focusQuestionList", focusQuestionList);
            mv.addObject("allFocusUserList", allFocusUserList);
            mv.addObject("allFocusQuestionList", allFocusQuestionList);
            mv.addObject("courseAndSectionList", courseAndSectionList);
            mv.addObject("tab", tab);
            mv.addObject("message", message);
        } catch (Exception e) {
            mv.setViewName("error/error");
            e.printStackTrace();
        }
        return mv;
    }

    @RequestMapping(value = "/follow", method = RequestMethod.POST)
    public String setFollow(UserFocus userFocus, HttpSession session) {
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }
        if(userFocus.getType().equals(2)){
            userFocusService.insert(userFocus);
            return "redirect:articleDetail?articleId=" + userFocus.getReadId();
        }else{
            Integer questionId = userFocus.getFocusId();
            Question question = questionService.selectByPrimaryKey(questionId);
            List<Answer> answerList = answerService.selectByQuestionId(questionId);
            Integer tempReadId = 0;
            if (question.getAnswerNum().equals(0)) {
                userFocus.setReadId(tempReadId);
            } else {
                for (Answer answer : answerList) {
                    if (answer.getId() > tempReadId) {
                        tempReadId = answer.getId();
                    }
                }
                userFocus.setReadId(tempReadId);
            }
            userFocusService.insert(userFocus);
            return "redirect:questionDetail?questionId=" + questionId;
        }
    }

    @RequestMapping(value = "/praise", method = RequestMethod.POST)
    public String setPraise(UserPraise userPraise, HttpSession session) {
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }
        if(userPraise.getType().equals(1)){
            articleService.updatePraiseNum(+1, userPraise.getPraiseId());
            userPraiseService.insert(userPraise);
            return "redirect:articleDetail?articleId=" + userPraise.getPraiseId();
        }else{
            Integer answerId = userPraise.getPraiseId();
            Answer answer = answerService.selectByPrimaryKey(answerId);
            Question question = questionService.selectByPrimaryKey(answer.getQuestionId());
            answerService.updatePraiseNum(+1, answerId);
            userPraiseService.insert(userPraise);
            return "redirect:questionDetail?questionId=" + question.getId();
        }
    }

    @RequestMapping(value = "/deleteFocus", method = RequestMethod.GET)
    public String deleteFocus(Integer userId, Integer focusId, Integer type, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }else if(!user.getId().equals(userId)){
            return "redirect:mySpace";
        }
        UserFocus userFocus = userFocusService.selectByUserIdAndFocusId(userId, focusId, type);
        userFocusService.deleteByPrimaryKey(userFocus.getId());
        return "redirect:mySpace?tab=" + type;
    }

    @RequestMapping(value = "/deleteArticle", method = RequestMethod.GET)
    public String deleteArticle(Integer userId, Integer articleId, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return "redirect:login";
        }else if(!user.getId().equals(userId)){
            return "redirect:mySpace";
        }
        articleService.deleteByPrimaryKey(articleId);
        commentService.deleteByRefId(articleId);
        replyService.deleteByRefId(articleId);
        return "redirect:mySpace?tab=" + 4;
    }

    @RequestMapping(value = "/uploadPic", method = RequestMethod.POST)
    public String uploadPic(Integer userId, MultipartFile pic) throws IllegalStateException, IOException {
        if (!pic.isEmpty()) {
            String path = "D:\\userimg\\";
            String originalFileName = pic.getOriginalFilename();
            // 新的图片名称
            String newFileName;
            if(!originalFileName.substring(originalFileName.lastIndexOf(".")).equals("jpg")){
                newFileName = userId +".jpg";
            }else{
                newFileName = userId + originalFileName.substring(originalFileName.lastIndexOf("."));
            }
            // 新的图片
            File newFile = new File(path + newFileName);
            // 将内存中的数据写入磁盘
            pic.transferTo(newFile);
        }
        return "redirect:mySpace";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public ModelAndView changePassword(Integer userId, String oldPassword, String newPassword, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        if(user == null){
            return new ModelAndView("redirect:login");
        }else if(!user.getId().equals(userId)){
            return new ModelAndView("redirect:mySpace");
        }
        String inputMD5;
        String oldMD5;
        String newMD5;
        try {
            inputMD5 = MD5Util.md5Encode(oldPassword);
            oldMD5 = user.getPassword();
            newMD5 = MD5Util.md5Encode(newPassword);
        }catch (Exception e) {
            ModelAndView mv = new ModelAndView("redirect:mySpace?tab=5");
            mv.addObject("message", "原密码输入错误！");
            return mv;
        }
        if(!inputMD5.equals(oldMD5)){
            ModelAndView mv = new ModelAndView("redirect:mySpace?tab=5");
            mv.addObject("message", "原密码输入错误！");
            return mv;
        }else{
            user.setPassword(newMD5);
            userService.updateByIdSelective(user);
            session.removeAttribute("loginUser");
            return new ModelAndView("redirect:login");
        }
    }
}