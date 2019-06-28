package learn.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {
    private Integer id;

    private String title;

    private Integer userId;

    private String username;

    private String articleType;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;

    private Integer praiseNum;

    private Integer commentNum;

    private Integer clickNum;

    private String summary;

    private String content;

    public Article(Integer id, String title, Integer userId, String username, String articleType, Date date, Integer praiseNum, Integer commentNum, Integer clickNum, String summary, String content) {
        this.id = id;
        this.title = title;
        this.userId = userId;
        this.username = username;
        this.articleType = articleType;
        this.date = date;
        this.praiseNum = praiseNum;
        this.commentNum = commentNum;
        this.clickNum = clickNum;
        this.summary = summary;
        this.content = content;
    }

    public Article() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getArticleType() {
        return articleType;
    }

    public void setArticleType(String articleType) {
        this.articleType = articleType == null ? null : articleType.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getPraiseNum() {
        return praiseNum;
    }

    public void setPraiseNum(Integer praiseNum) {
        this.praiseNum = praiseNum;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}