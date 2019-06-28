package learn.entity;

public class CourseSection {
    private Integer id;

    private Integer courseId;

    private Integer parentId;

    private String name;

    public CourseSection(Integer id, Integer courseId, Integer parentId, String name) {
        this.id = id;
        this.courseId = courseId;
        this.parentId = parentId;
        this.name = name;
    }

    public CourseSection() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    @Override
    public String toString() {
        return "CourseSection{" +
                "id=" + id +
                ", courseId=" + courseId +
                ", parentId=" + parentId +
                ", name='" + name + '\'' +
                '}';
    }

}