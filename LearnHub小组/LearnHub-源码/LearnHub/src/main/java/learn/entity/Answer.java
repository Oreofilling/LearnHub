package learn.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Answer {
    private Integer id;

    private Integer userId;

    private String userName;

    private Integer questionId;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;

    private Integer commentNum;

    private Integer praiseNum;

    private String content;

    public Answer(Integer id, Integer userId, String userName, Integer questionId, Date date, Integer commentNum, Integer praiseNum, String content) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.questionId = questionId;
        this.date = date;
        this.commentNum = commentNum;
        this.praiseNum = praiseNum;
        this.content = content;
    }

    public Answer() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Integer getPraiseNum() {
        return praiseNum;
    }

    public void setPraiseNum(Integer praiseNum) {
        this.praiseNum = praiseNum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}