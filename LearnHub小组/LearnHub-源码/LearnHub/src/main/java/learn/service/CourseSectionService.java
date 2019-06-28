package learn.service;

import learn.entity.CourseSection;
import learn.entity.CourseSectionVO;

import java.util.List;

/**
 * Created by Kai on 2019/4/10.
 */
public interface CourseSectionService {

    int deleteByPrimaryKey(Integer id);

    int insert(CourseSection record);

    int insertSelective(CourseSection record);

    CourseSection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CourseSection record);

    int updateByPrimaryKey(CourseSection record);

    List<CourseSectionVO> queryCourseSection(Integer courseId);

    int selectCourseIdBySectionId(Integer id);

}
