package learn.entity;

public class Exam {
    private Integer id;

    private String title;

    private Integer courseId;

    public Exam(Integer id, String title, Integer courseId) {
        this.id = id;
        this.title = title;
        this.courseId = courseId;
    }

    public Exam() {
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

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
}