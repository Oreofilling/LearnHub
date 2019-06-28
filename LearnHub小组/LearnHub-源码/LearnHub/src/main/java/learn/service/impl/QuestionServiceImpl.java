package learn.service.impl;


import jdk.nashorn.internal.ir.annotations.Ignore;
import learn.dao.AnswerMapper;
import learn.dao.QuestionMapper;
import learn.entity.Answer;
import learn.entity.Question;
import learn.entity.QuestionAndBestAnswer;
import learn.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Kai on 2019/4/12.
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionMapper;
    @Autowired
    private AnswerMapper answerMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Question record) {
        questionMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(Question record) {
        questionMapper.insertSelective(record);
        return 0;
    }

    @Override
    public Question selectByPrimaryKey(Integer id) {
        return questionMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Question record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Question record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Question record) {
        return 0;
    }

    @Override
    public List<QuestionAndBestAnswer> queryQuestionAndBestAnswer(String type, int tab) {
        List<QuestionAndBestAnswer> questionAndBestAnswerList = new ArrayList<>();
        List<Question> questions = new ArrayList<>();
        if (tab == 3) {
            if (type.equals("全部")) {
                questions = questionMapper.selectEmptyAnswer();
            } else {
                questions = questionMapper.selectEmptyAnswerByType(type);
            }
            for (Question question : questions) {
                QuestionAndBestAnswer questionAndBestAnswer = new QuestionAndBestAnswer();
                questionAndBestAnswer = setQuestionInfo(question);
                questionAndBestAnswerList.add(questionAndBestAnswer);
            }
            return questionAndBestAnswerList;
        } else {
            if (type.equals("全部")) {
                questions = questionMapper.selectAll();
            } else {
                questions = questionMapper.selectByType(type);
            }
            for (Question question : questions) {
                QuestionAndBestAnswer questionAndBestAnswer = new QuestionAndBestAnswer();
                questionAndBestAnswer = setQuestionInfo(question);
                Answer answer = new Answer();
                answer = answerMapper.selectBestByQuestionId(question.getId());
                questionAndBestAnswer.setAnswerId(answer.getId());
                questionAndBestAnswer.setAnswerPraiseNum(answer.getPraiseNum());
                questionAndBestAnswer.setAnswerContent(answer.getContent());
                questionAndBestAnswerList.add(questionAndBestAnswer);
            }
        }
        Comparator<QuestionAndBestAnswer> comparatorByDate = new Comparator<QuestionAndBestAnswer>() {

            @Override
            public int compare(QuestionAndBestAnswer qa1, QuestionAndBestAnswer qa2) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                int date1 = Integer.parseInt(sdf.format(qa1.getQuestionDate()));
                int date2 = Integer.parseInt(sdf.format(qa2.getQuestionDate()));
                if (date1 != date2) {
                    return date2 - date1;
                } else
                    return qa2.getQuestionId() - qa1.getQuestionId();
            }
        };
        Comparator<QuestionAndBestAnswer> comparatorByClickNum = new Comparator<QuestionAndBestAnswer>() {
            @Override
            public int compare(QuestionAndBestAnswer qa1, QuestionAndBestAnswer qa2) {
                if (!qa1.getQuestionClickNum().equals(qa2.getQuestionClickNum())) {
                    return qa2.getQuestionClickNum() - qa1.getQuestionClickNum();
                } else
                    return qa2.getQuestionId() - qa1.getQuestionId();
            }
        };
        if (tab == 1) {
            Collections.sort(questionAndBestAnswerList, comparatorByDate);
        } else if (tab == 2) {
            Collections.sort(questionAndBestAnswerList, comparatorByClickNum);
        }
        return questionAndBestAnswerList;
    }

    @Override
    public List<Question> selectAll() {
        return questionMapper.selectAll();
    }

    @Override
    public List<Question> selectEmptyAnswer() {
        return questionMapper.selectEmptyAnswer();
    }

    @Override
    public List<Question> selectByType(String type) {
        return questionMapper.selectByType(type);
    }

    @Override
    public List<Question> selectEmptyAnswerByType(String type) {
        return questionMapper.selectEmptyAnswerByType(type);
    }

    @Override
    public List<Question> search(String searchString) {
        return questionMapper.search(searchString);
    }

    @Override
    public List<QuestionAndBestAnswer> searchQuestionAndBestAnswer(String searchString) {
        List<QuestionAndBestAnswer> questionAndBestAnswerList = new ArrayList<>();
        List<Question> questions = new ArrayList<>();
        questions = questionMapper.search(searchString);
        for (Question question : questions) {
            QuestionAndBestAnswer questionAndBestAnswer = new QuestionAndBestAnswer();
            questionAndBestAnswer = setQuestionInfo(question);
            if(question.getAnswerNum() != 0){
                Answer answer = new Answer();
                answer = answerMapper.selectBestByQuestionId(question.getId());
                questionAndBestAnswer.setAnswerId(answer.getId());
                questionAndBestAnswer.setAnswerPraiseNum(answer.getPraiseNum());
                questionAndBestAnswer.setAnswerContent(answer.getContent());
            }
            questionAndBestAnswerList.add(questionAndBestAnswer);
        }
        return questionAndBestAnswerList;
    }

    public QuestionAndBestAnswer setQuestionInfo(Question question){
        QuestionAndBestAnswer questionAndBestAnswer = new QuestionAndBestAnswer();
        questionAndBestAnswer.setId(question.getId());
        questionAndBestAnswer.setQuestionId(question.getId());
        questionAndBestAnswer.setQuestionUserId(question.getUserId());
        questionAndBestAnswer.setQuestionUserName(question.getUserName());
        questionAndBestAnswer.setQuestionDate(question.getDate());
        questionAndBestAnswer.setQuestionType(question.getType());
        questionAndBestAnswer.setQuestionAnswerNum(question.getAnswerNum());
        questionAndBestAnswer.setQuestionClickNum(question.getClickNum());
        questionAndBestAnswer.setQuestionTitle(question.getTitle());
        return questionAndBestAnswer;
    }

    @Override
    public QuestionAndBestAnswer selectQuestionAndBestAnswer(Integer id){
        Question question = questionMapper.selectByPrimaryKey(id);
        QuestionAndBestAnswer questionAndBestAnswer = setQuestionInfo(question);
        Answer answer = answerMapper.selectBestByQuestionId(question.getId());
        questionAndBestAnswer.setAnswerId(answer.getId());
        questionAndBestAnswer.setAnswerPraiseNum(answer.getPraiseNum());
        questionAndBestAnswer.setAnswerContent(answer.getContent());
        return questionAndBestAnswer;
    }

    @Override
    public int updateAnswerNum(Integer change, Integer id){
        questionMapper.updateAnswerNum(change, id);
        return 0;
    }

    @Override
    public int updateClickNum(Integer change, Integer id){
        questionMapper.updateClickNum(change, id);
        return 0;
    }

    @Override
    public List<Question> selectFive(){
        return questionMapper.selectFive();
    }

    @Override
    public List<QuestionAndBestAnswer> selectFiveQuestionAndBestAnswer(){
        List<Question> questionList = questionMapper.selectFive();
        List<QuestionAndBestAnswer> questionAndBestAnswerList = new ArrayList<>();
        for(Question question:questionList){
            QuestionAndBestAnswer questionAndBestAnswer = setQuestionInfo(question);
            Answer answer = answerMapper.selectBestByQuestionId(question.getId());
            questionAndBestAnswer.setAnswerId(answer.getId());
            questionAndBestAnswer.setAnswerPraiseNum(answer.getPraiseNum());
            questionAndBestAnswer.setAnswerContent(answer.getContent());
            questionAndBestAnswerList.add(questionAndBestAnswer);
        }
        return questionAndBestAnswerList;
    }
}
