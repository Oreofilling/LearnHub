package learn.entity;

public class UserPraise {
    private Integer id;

    private Integer userId;

    private Integer praiseId;

    private Integer type;

    public UserPraise(Integer id, Integer userId, Integer praiseId, Integer type) {
        this.id = id;
        this.userId = userId;
        this.praiseId = praiseId;
        this.type = type;
    }

    public UserPraise() {
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

    public Integer getPraiseId() {
        return praiseId;
    }

    public void setPraiseId(Integer praiseId) {
        this.praiseId = praiseId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}