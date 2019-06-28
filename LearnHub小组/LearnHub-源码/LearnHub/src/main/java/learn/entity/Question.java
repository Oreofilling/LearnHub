package learn.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Question {
    private Integer id;

    private Integer userId;

    private String userName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;

    private String type;

    private Integer answerNum;

    private Integer clickNum;

    private String title;

    private String content;

    public Question(Integer id, Integer userId, String userName, Date date, String type, Integer answerNum, Integer clickNum, String title, String content) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.date = date;
        this.type = type;
        this.answerNum = answerNum;
        this.clickNum = clickNum;
        this.title = title;
        this.content = content;
    }

    public Question() {
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getAnswerNum() {
        return answerNum;
    }

    public void setAnswerNum(Integer answerNum) {
        this.answerNum = answerNum;
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}