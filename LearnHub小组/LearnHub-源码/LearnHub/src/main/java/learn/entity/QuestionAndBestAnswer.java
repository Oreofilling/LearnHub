package learn.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by Kai on 2019/4/12.
 */
public class QuestionAndBestAnswer {
    private Integer id;

    private Integer questionId;

    private Integer questionUserId;

    private String questionUserName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date questionDate;

    private String questionType;

    private Integer questionAnswerNum;

    private Integer questionClickNum;

    private String questionTitle;

    private Integer answerId;

    private Integer answerPraiseNum;

    private String answerContent;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public Integer getQuestionUserId() {
        return questionUserId;
    }

    public void setQuestionUserId(Integer questionUserId) {
        this.questionUserId = questionUserId;
    }

    public String getQuestionUserName() {
        return questionUserName;
    }

    public void setQuestionUserName(String questionUserName) {
        this.questionUserName = questionUserName;
    }

    public Date getQuestionDate() {
        return questionDate;
    }

    public void setQuestionDate(Date questionDate) {
        this.questionDate = questionDate;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public Integer getQuestionAnswerNum() {
        return questionAnswerNum;
    }

    public void setQuestionAnswerNum(Integer questionAnswerNum) {
        this.questionAnswerNum = questionAnswerNum;
    }

    public Integer getQuestionClickNum() {
        return questionClickNum;
    }

    public void setQuestionClickNum(Integer questionClickNum) {
        this.questionClickNum = questionClickNum;
    }

    public String getQuestionTitle() {
        return questionTitle;
    }

    public void setQuestionTitle(String questionTitle) {
        this.questionTitle = questionTitle;
    }

    public Integer getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }

    public Integer getAnswerPraiseNum() {
        return answerPraiseNum;
    }

    public void setAnswerPraiseNum(Integer answerPraiseNum) {
        this.answerPraiseNum = answerPraiseNum;
    }

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

}
