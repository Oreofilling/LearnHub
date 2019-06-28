package learn.entity;

public class UserFocus {
    private Integer id;

    private Integer userId;

    private Integer focusId;

    private Integer type;

    private Integer readId;

    public UserFocus(Integer id, Integer userId, Integer focusId, Integer type, Integer readId) {
        this.id = id;
        this.userId = userId;
        this.focusId = focusId;
        this.type = type;
        this.readId = readId;
    }

    public UserFocus() {
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

    public Integer getFocusId() {
        return focusId;
    }

    public void setFocusId(Integer focusId) {
        this.focusId = focusId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getReadId() {
        return readId;
    }

    public void setReadId(Integer readId) {
        this.readId = readId;
    }
}