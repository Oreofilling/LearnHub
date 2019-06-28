package learn.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Kai on 2019/4/10.
 */
public class CourseSectionVO extends CourseSection {

    //小节
    private List<CourseSection> sections = new ArrayList<>();

    public List<CourseSection> getSections() {
        return sections;
    }

    public void setSections(List<CourseSection> sections) {
        this.sections = sections;
    }

}
