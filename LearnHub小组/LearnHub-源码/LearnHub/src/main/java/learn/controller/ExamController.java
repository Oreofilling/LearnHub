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
import java.util.List;

@Controller

/**
 * Created by Kai on 2019/4/10.
 */

public class ExamController {
    @Autowired
    private ExamService examService;
    @Autowired
    private ExamQuestionService examQuestionService;

    @RequestMapping(value = "/exam", method = RequestMethod.GET)
    public ModelAndView getExam() {
        ModelAndView mv = new ModelAndView();
        try {
            List<Exam> examList = examService.selectAll();
            mv.setViewName("exam");
            mv.addObject("examList", examList);
        } catch (Exception e) {
            mv.setViewName("error/error");
            e.printStackTrace();
        }
        return mv;
    }

    @RequestMapping(value = "/examDetail", method = RequestMethod.GET)
    public ModelAndView getExamDetail(Integer examId) {
        Exam exam = examService.selectByPrimaryKey(examId);
        List<ExamQuestion> examQuestionList = examQuestionService.selectByExamId(examId);
        int[] correctOptions = new int[examQuestionList.size()];
        for(int i = 0; i < examQuestionList.size(); i++){
            correctOptions[i] = examQuestionList.get(i).getCorrectAnswer();
        }
        ModelAndView mv = new ModelAndView();
        mv.addObject("exam", exam);
        mv.addObject("examQuestionList", examQuestionList);
        mv.addObject("correctAnswerList", correctOptions);
        return mv;
    }

}
