package learn.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Comment {
    private Integer id;

    private Integer userId;

    private String userName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;

    private Integer commentType;

    private Integer commentRefId;

    private Integer praiseNum;

    private Integer replyNum;

    private String commentContent;

    public Comment(Integer id, Integer userId, String userName, Date date, Integer commentType, Integer commentRefId, Integer praiseNum, Integer replyNum, String commentContent) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.date = date;
        this.commentType = commentType;
        this.commentRefId = commentRefId;
        this.praiseNum = praiseNum;
        this.replyNum = replyNum;
        this.commentContent = commentContent;
    }

    public Comment() {
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

    public Integer getCommentType() {
        return commentType;
    }

    public void setCommentType(Integer commentType) {
        this.commentType = commentType;
    }

    public Integer getCommentRefId() {
        return commentRefId;
    }

    public void setCommentRefId(Integer commentRefId) {
        this.commentRefId = commentRefId;
    }

    public Integer getPraiseNum() {
        return praiseNum;
    }

    public void setPraiseNum(Integer praiseNum) {
        this.praiseNum = praiseNum;
    }

    public Integer getReplyNum() {
        return replyNum;
    }

    public void setReplyNum(Integer replyNum) {
        this.replyNum = replyNum;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }
}