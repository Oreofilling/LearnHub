package learn.dao;

import learn.entity.*;

import java.util.List;

public interface CourseSectionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CourseSection record);

    int insertSelective(CourseSection record);

    CourseSection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CourseSection record);

    int updateByPrimaryKey(CourseSection record);

    List<CourseSection> selectByCourseId(Integer courseId);

    int selectCourseIdBySectionId(Integer id);
}