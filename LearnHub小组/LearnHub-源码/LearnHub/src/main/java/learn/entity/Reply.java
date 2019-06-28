package learn.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Reply {
    private Integer id;

    private Integer userId;

    private String userName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;

    private Integer replyType;

    private Integer replyRefId;

    private Integer replyParentId;

    private Integer praiseNum;

    private String replyContent;

    public Reply(Integer id, Integer userId, String userName, Date date, Integer replyType, Integer replyRefId, Integer replyParentId, Integer praiseNum, String replyContent) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.date = date;
        this.replyType = replyType;
        this.replyRefId = replyRefId;
        this.replyParentId = replyParentId;
        this.praiseNum = praiseNum;
        this.replyContent = replyContent;
    }

    public Reply() {
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

    public Integer getReplyType() {
        return replyType;
    }

    public void setReplyType(Integer replyType) {
        this.replyType = replyType;
    }

    public Integer getReplyRefId() {
        return replyRefId;
    }

    public void setReplyRefId(Integer replyRefId) {
        this.replyRefId = replyRefId;
    }

    public Integer getReplyParentId() {
        return replyParentId;
    }

    public void setReplyParentId(Integer replyParentId) {
        this.replyParentId = replyParentId;
    }

    public Integer getPraiseNum() {
        return praiseNum;
    }

    public void setPraiseNum(Integer praiseNum) {
        this.praiseNum = praiseNum;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent == null ? null : replyContent.trim();
    }
}